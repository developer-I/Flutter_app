
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';


class logout extends StatefulWidget {
  @override
  _logoutState createState() => _logoutState();
}

class _logoutState extends State<logout> {

  _logoutState(){
    removeValues();
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove('email');
    //Remove bool
    prefs.remove("pass");
    getStringValuesSF();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringEmail = prefs.getString('email');
    String stringPass = prefs.getString('pass');

    if(stringEmail == null && stringPass == null){
      Timer(Duration(seconds: 3), () {
        print("Yeah, this line is printed after 3 seconds");
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            MyApp()), (Route<dynamic> route) => false);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => MyApp()));
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    _logoutState();

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

