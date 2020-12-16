import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(reports());
}

class reports extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: employeeReports(),
    );
  }
}

class employeeReports extends StatefulWidget {
  @override
  _employeeReports createState() => _employeeReports();
}

class _employeeReports extends State<employeeReports> {
  var rlength;
  var Email;
  var responseJson;
  var jum = 2;

  void initState() {
    initplatformstate();
  }

  void initplatformstate() async {
    var res = await http.get(
        'http://192.168.0.200/Vipin/AdminUser/index.php/Connector/encode_data');

    setState(() {
      responseJson = jsonDecode(res.body.toString());
      this.rlength = responseJson.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Reports'),
      ),
      body: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Column(
              children: [
                Padding(padding: new EdgeInsets.fromLTRB(0, 30, 0, 0)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.89,
                  height: MediaQuery.of(context).size.height * 0.26,
                  padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.green,
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors
                                  .white, //                   <--- border color
                              width: 5.0,
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/4050289/pexels-photo-4050289.jpeg?cs=srgb&dl=pexels-vlada-karpovich-4050289.jpg&fm=jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                                responseJson[index]['firstname'] +
                                    " " +
                                    responseJson[index]['lastname'],
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: new EdgeInsets.fromLTRB(0, 20, 0, 0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.50,
                  padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.green,
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: new EdgeInsets.fromLTRB(25, 0, 0, 0),
                              ),
                              Text(" Designation : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              Text(responseJson[index]['designation'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: new EdgeInsets.fromLTRB(25, 0, 0, 0),
                              ),
                              Text(" Mobile : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              Text(responseJson[index]['mobile'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: new EdgeInsets.fromLTRB(25, 0, 0, 0),
                              ),
                              Text(" Gender : ",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              Text(responseJson[index]['gender'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: new EdgeInsets.fromLTRB(25, 0, 0, 0),
                              ),
                              Text(" Password : ",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(responseJson[index]['password'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  )),
                            ],
                          ),
                        ),

                        /**============================================================================== */
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 20.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "PRESENTS",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "5200",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.pinkAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "ABESENTS",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "28.5K",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.pinkAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: Column(
                                //     children: <Widget>[
                                //       Text(
                                //         "Follow",
                                //         style: TextStyle(
                                //           color: Colors.redAccent,
                                //           fontSize: 22.0,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         height: 5.0,
                                //       ),
                                //       Text(
                                //         "1300",
                                //         style: TextStyle(
                                //           fontSize: 20.0,
                                //           color: Colors.pinkAccent,
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        //         ],
                        //       ),
                        //     ),
                        //   )
                        // )
                        /**============================================================================== */
                        /**============================================================================== */
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 0.5, 0, 0),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 20.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "UNDER-TIME",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "5200",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.pinkAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "OVER-TIME",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "28.5K",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.pinkAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: Column(
                                //     children: <Widget>[
                                //       Text(
                                //         "Follow",
                                //         style: TextStyle(
                                //           color: Colors.redAccent,
                                //           fontSize: 22.0,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         height: 5.0,
                                //       ),
                                //       Text(
                                //         "1300",
                                //         style: TextStyle(
                                //           fontSize: 20.0,
                                //           color: Colors.pinkAccent,
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        )
                        //         ],
                        //       ),
                        //     ),
                        //   )
                        // )
                        /**============================================================================== */
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: rlength,
        viewportFraction: 1.0,
        scale: 0.5,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
