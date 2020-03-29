import 'package:flutter/material.dart';
import 'package:world_tme/pages/home.dart';
import 'package:world_tme/pages/choose_location.dart';
import 'package:world_tme/pages/loading.dart';




void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/':(context) => Loading(),
    '/home': (context) =>Home(),
    '/location':(context) => Chooselocation(),
  },
));

