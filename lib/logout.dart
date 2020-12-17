
import 'package:flutter/material.dart';
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
      build(context);
    }

  }

  @override
  Widget build(BuildContext context) {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );


    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Center(
                child: Text("Something is wrong with you ...... "),
               ),

              FlatButton(
                child: Text('Forced logout....'),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {

                },
              ),
            ],
          ),
      ),
      ),
    );
  }
}

