import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/pages/Home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {


  TextEditingController _controller=TextEditingController();


  List<Weather> weatherdata=
  [
    Weather(cityname:'Tiruchirappalli'),
    Weather(cityname:'Delhi'),
    Weather(cityname:'Kolkata'),
    Weather(cityname:'Mumbai'),
    Weather(cityname:'Madurai'),
    Weather(cityname:'Coimbatore'),
    Weather(cityname:'Hyderabad'),
    Weather(cityname:'Pune'),
    Weather(cityname:'Surat'),
    Weather(cityname:'Chennai'),
    Weather(cityname:'Jaipur'),
    Weather(cityname:'Lucknow'),
    Weather(cityname:'Kanpur'),
    Weather(cityname:'Nagpur'),
    Weather(cityname:'Visakhapatnam'),
    Weather(cityname:'Patna'),
    Weather(cityname:'Bhopal'),
    Weather(cityname:'Indore'),
    Weather(cityname:'Agra'),
    Weather(cityname:'Ahmadabad'),
  ];



  void getdata(String cityname) async {
    Weather? selectedcity;

    for (var weather in weatherdata) {
      if (weather.cityname.toLowerCase() == cityname.toLowerCase()) {
        selectedcity = weather;
        break;
      }
    }
    if (selectedcity != null) {
      await selectedcity.getweather();
      Navigator.pop(context, {
        'cityname': selectedcity.cityname,
        'time': selectedcity.time,
        'temp': selectedcity.temp_c,
        'condition': selectedcity.condition,
        'windspeed': selectedcity.windspeed,
        'humidity': selectedcity.humidity,
        'rain': selectedcity.rain,
        'sunset': selectedcity.sunset,
        'sunrise': selectedcity.sunrise,
      });
    }  else {

       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('City not found')),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata(_controller.text);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(10.0,50.0,0.0,0.0),

        child: Column(
          children: [
            Row(
              children: [
                BackButton(),
                SizedBox(
                  height: 40.0,
                  width: 300.0,
                  // Search bar widget
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Enter the City',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.black),
                        )
                    ),
                  ),
                ),
               TextButton(
                      onPressed: () {
                        getdata(_controller.text);
                      },
                      child: Text('Search',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
              child: Center(
                child: SpinKitWave(
                  color: Colors.yellowAccent,
                  size: 100.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

