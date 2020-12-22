import 'dart:async';

import 'Reports.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Rhandle extends StatefulWidget {
  @override
  _RhandleState createState() => _RhandleState();


}

class _RhandleState extends State<Rhandle> {


  // _RhandleState(){
  //   showReports();
  // }
  // showReports() {
  //
  //
  //     // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  //     //     employeeReports()), (Route<dynamic> route) => false);
  //
  //   // });
  // }


  @override
  Widget build(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => employeeReports()));
    return MaterialApp(

      home: Scaffold(
        body: Container(
            child: Center(
              child: Stack(
                children: [
                  new Container(

                    padding: EdgeInsets.all(15.0),
                    child: new LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      percent: 0.9,
                      center: Text("90.0%"),

                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Color(0XFFF92B7F),

                    ),

                  ),

                ],
              ),
            )
        ),
      ),
    );
  }
}
