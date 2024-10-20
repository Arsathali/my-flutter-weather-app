import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loadscreen extends StatefulWidget {
  const Loadscreen({super.key});

  @override
  State<Loadscreen> createState() => _LoadscreenState();
}

class _LoadscreenState extends State<Loadscreen> {


   void passcondition() async {
        Weather obj=Weather(cityname:'Chennai');
        await  obj.getweather();
        Navigator.pushReplacementNamed(context, '/home' ,arguments: {
         'cityname' : obj.cityname,
         'time' :     obj.time,
         'temp' :     obj.temp_c,
         'condition': obj.condition,
         'windspeed': obj.windspeed,
         'humidity' : obj.humidity,
          'rain' :     obj.rain,
          'sunset' :   obj.sunset,
          'sunrise':  obj.sunrise,
        }

        );
        print(obj.sunrise);
   }

@override
  void initState() {
    super.initState();
    passcondition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitWave(
          color: Colors.yellowAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
