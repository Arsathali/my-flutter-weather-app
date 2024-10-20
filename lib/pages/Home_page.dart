import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Map data={};

  @override
  Widget build(BuildContext context) {




    final datafrom=data.isNotEmpty? data: ModalRoute.of(context)?.settings.arguments as Map?;


    if(datafrom!=null){
      data=datafrom;
    }
    print(data);

   String raindata=data['rain'];
   String rainfor='No Rain';
   String warning='some';
   String expect='expecting';
   Color color=Colors.yellow;
   IconData icons=Icons.add;
   String images='sunnycloud.png';

   double Rain=double.parse(raindata);

   if(Rain==0.0){
     raindata='0%';
     rainfor='No Rain';
     expect='No Rain is Expected';
     warning='Clear Skies';
      icons=Icons.sunny ;
      color=Colors.blue;
      images='sunnycloud.png';
   }
   else if(Rain>0.1 && Rain<0.26){
     raindata='25%';
     rainfor='10-30 Min';
     expect='Light Rain Expected';
     warning='Chance of Rain';
     icons=Icons.cloud_queue ;
     color=Colors.blue;
     images='sunnycloud.png';
   }
   else if(Rain>0.26 && Rain<0.75){
     raindata='50%';
     rainfor='30-60 Min';
     expect='Moderate Rain Exp';
     warning='Possible rain';
     icons=Icons.cloud;
     color=Colors.yellowAccent;
     images='sunnycloud.png';
   }
   else if(Rain>0.75 && Rain<1.0){
     raindata='75%';
     rainfor='1-2 Hours';
     expect='Heavy Rain Expected';
     warning='Stay Home';
     icons=Icons.umbrella;
     color=Colors.yellowAccent;
      images='sunnycloud.png';
   }
   else if(Rain<1.0){
     raindata='100%';
     rainfor='+2 Hours';
     expect='Very Heavy Rain';
     warning='Warning';
     icons=Icons.warning;
     color=Colors.red;
     images='raincloud.PNG';
   }


    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            width: 400.0,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() async{

                                    dynamic result=await Navigator.pushNamed(context, '/search');
                                    setState(() {
                                      data={
                                        'cityname': result['cityname'],
                                        'time': result['time'],
                                        'temp': result['temp'],
                                        'condition': result['condition'],
                                        'windspeed': result['windspeed'],
                                        'humidity':result['humidity'],
                                        'rain': result['rain'],
                                        'sunset': result['sunset'],
                                        'sunrise': result['sunrise'],
                                      };
                                    });

                                });
                              },
                              child: Text('Search For Cities'),
                            ),
                          ),
                      ]
                      ),
                      SizedBox(height: 20.0),
                       //condition image
                       Container(
                         child: Image.asset('assets/$images'),
                         width: 200,
                         height: 180,
                
                       ),
                      // City name widget + icon in rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            data['cityname'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Icon(
                          Icons.pin_drop,
                        size: 30.0,
                        ),
                      ],
                      ),
                      //degree
                      Text(
                          '${data['temp']}°',
                        style: TextStyle(
                           fontSize: 70.0,
                
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      //container rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 240,
                              width: 250,
                              color: Colors.grey[200],
                              child: Column(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Row(
                                           children: [
                                             Icon(
                                                 icons,
                                               color: color,
                                             ),
                                             SizedBox(width: 10.0),
                                             Text(
                                                 warning,
                                               style: TextStyle(
                                                 color: color,
                                                 fontWeight: FontWeight.bold,
                                                 fontSize: 20.0,
                                                 letterSpacing: 2.0,
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(20.0,40.0,0.0,0.0),
                                         child: Row(
                                           children: [
                                             Text(
                                                 '%Rain',
                                               style: TextStyle(
                                                 color: Colors.grey[700],
                                                 fontWeight: FontWeight.w500,
                                                 fontSize: 20.0,
                                                 letterSpacing: 2.0,
                                                 fontStyle: FontStyle.italic,
                                               ),
                                             ),
                                             SizedBox(width: 40.0),
                                             Text(
                                               'Duration',
                                               style: TextStyle(
                                                 color: Colors.grey[700],
                                                 fontWeight: FontWeight.w500,
                                                 fontSize: 20.0,
                                                 letterSpacing: 2.0,
                                                 fontStyle: FontStyle.italic,
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 10.0),
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(40.0,0.0,0.0,0.0),
                                         child: Row(
                                           children: [
                                             Text(
                                               raindata,
                                               style: TextStyle(
                                                 color: Colors.grey[800],
                                                 fontWeight: FontWeight.w500,
                                                 fontSize: 20.0,
                                                 letterSpacing: 2.0,
                                                 fontStyle: FontStyle.italic,
                                               ),
                                             ),
                                             SizedBox(width: 48.0),
                                             Text(
                                               rainfor,
                                               style: TextStyle(
                                                 color: Colors.grey[800],
                                                 fontWeight: FontWeight.w600,
                                                 fontSize: 20.0,
                                                 letterSpacing: 2.0,
                                                 fontStyle: FontStyle.italic,
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                                         child: Text(
                                             expect,
                                           style: TextStyle(
                                             color: color,
                                             fontWeight: FontWeight.w600,
                                             fontSize: 21.0,
                                             letterSpacing: 2.0,
                                           ),

                                         ),
                                       ),
                                     ],
                              ),
                          ),
                          //container 2 in row
                          Container(
                              height: 240,
                              width: 150,
                              color: Colors.grey[200],
                            child: Column(
                              children: [
                                Image.asset('assets/$images'),
                              ],
                            ),

                          ),
                        ],
                      ),
                      // Container(
                      //   height: 300,
                      //   width: 400,
                      //   color: Colors.grey[400],
                      // ),
                      //container 3
                      SizedBox(height: 15.0),
                      Container(
                        height: 100,
                        width: 400,
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Time',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      letterSpacing: 2.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(width: 35.0),
                                  Text(
                                    'Humidity',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      letterSpacing: 2.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(width: 20.0),
                                  Text(
                                    'Wind',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.0,
                                      letterSpacing: 2.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                SizedBox(width: 34.0),
                                Text(
                                  data['time'],
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(width: 98.0),
                                Text(
                                  data['humidity'],
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(width: 97.0),
                                Text(
                                  data['windspeed'],
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //container 4
                      SizedBox(height: 15.0),
                      Container(
                        height: 300,
                        width: 400,
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14.0,10.0,0.0,0.0),
                              child: Row(
                                children: [
                                    Text(
                                        'Sunrise & Sunset',
                                          style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.0,
                                          letterSpacing: 2.0,
                                          fontStyle: FontStyle.italic,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 5.0),
                                    Image.asset('assets/sunrise.png',
                                  height: 150.0,
                                  width: 140.0,
                                ),
                                SizedBox(width: 150.0),

                                Image.asset('assets/sunset.webp',
                                  height: 80.0,
                                  width: 80.0,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 30.0),
                                Text(
                                    'SunRise',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(width: 180.0),
                                Text(
                                  'SunSet',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 20.0),
                                Text(
                                  data['sunrise'],
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontStyle: FontStyle.italic,
                                  ),

                                ),
                                SizedBox(width: 163.0),
                                Text(
                                  data['sunset'],
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                    letterSpacing: 2.0,
                                    fontStyle: FontStyle.italic,
                                  ),

                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
