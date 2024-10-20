import 'package:flutter/material.dart';
import 'package:weather_app/pages/Home_page.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/search.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/load',
 routes: {
   '/load':(context)=> Loadscreen(),
   '/home': (context)=>  Home(),
    '/search':(context)=> Search(),
}
));


