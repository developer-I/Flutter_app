import 'dart:convert';

import 'package:flutter/material.dart';
import 'logout.dart';
import 'package:http/http.dart' as http;

class UserLogs extends StatefulWidget {
  var email;
  UserLogs(this.email);
  @override
  _UserLogsState createState() => _UserLogsState(email);
}

class _UserLogsState extends State<UserLogs> {

  var emaili;

  _UserLogsState(this.emaili);

  void initplatformstate() async {
    final res = await http.get(
        "http://192.168.0.200/Vipin/AdminUser/index.php/Connector/UserLogs?email=$emaili");

    setState(() {
      var responseJson = jsonDecode(res.body.toString());

    });


  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.logout, color: Colors.black ),  tooltip: "Logout",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => logout()));
            },
          ),
          backgroundColor: Color(0XFFF92B7F),
          title: Text(" Profile "),
          centerTitle: true,
        ),
      ),
    );
  }
}
