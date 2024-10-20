import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';


class Weather {

  String cityname = '';
  String time = '';
  String temp_c = '';
  String condition = '';
  String windspeed = '';
  String humidity = '';
  String rain = '';
  String sunset = '';
  String sunrise = '';

 //constructor

  Weather({required this.cityname});

  //api key
  String key = 'f62c3806735a4f43af510648241910';

  Future<void> getweather() async {
    try {
      //1st api
      Response response = await get(Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=$key&q=$cityname,India&aqi=no'));


      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        //2nd api
        Response response1 = await get(Uri.parse(
            'http://api.weatherapi.com/v1/astronomy.json?key=$key&q=$cityname&dt=2024-10-19 '));

        if (response.statusCode == 200) {
          Map data1 = jsonDecode(response1.body);

          //time data
          String inittime=data['location']['localtime'];
          DateTime now=DateTime.parse(inittime);
          String formattedTime = DateFormat('HH:mm').format(now);
          time=formattedTime;

          //temperature data
          temp_c=data['current']['temp_c'].toString();

          //condition data
          condition=data['current']['condition']['text'].toString();

          //windspeed data
          windspeed=data['current']['wind_kph'].toString();

          //humidity data
          humidity=data['current']['humidity'].toString();

          //rain data
          rain=data['current']['precip_mm'].toString();

          //sunrise data
          sunrise=data1['astronomy']['astro']['sunrise'];

          //sunset data
          sunset=data1['astronomy']['astro']['sunset'];

        } else {
          print('error occcurs in fetching the weather data ${response1
              .statusCode} ');
        }
      }
      else {
        print('error occurs in fetching astronomy data${response.statusCode}');
      }
    } catch (e) {
      print('error has been occured try later');
    }
  }
}

