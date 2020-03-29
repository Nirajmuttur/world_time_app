import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  String location;  //location mame for UI
  String time;  //time in that location
  String flag;  //url for different flags
  String url; //location of api endpoints
  bool isDaytime; //true or false for day/night

  WorldTime({this.location,this.flag,this.url});


  //making request
  Future<void> getTime() async{
    try{Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    //print(data);

    //getting date time property
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);

    //creating datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // print(now);

    //setting time property

    isDaytime = now.hour > 6 && now.hour < 20 ? true : false ;
    time = DateFormat.jm().format(now);
    }

    catch(e){
      print('$e');
      time = 'could not fetch time';
    }

  }
}