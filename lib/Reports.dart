import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(reports());
}
class reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userReportsPage(title: 'Employee Reports'),
    );
  }
}

class userReportsPage extends StatefulWidget {
  userReportsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _userReportsPage createState() => _userReportsPage();
}

class _userReportsPage extends State<userReportsPage> {
  int _counter = 0;
  var Email;
  var responseJson;
  var jum=2;

  void initState() {
    initplatformstate();
  }

  void initplatformstate() async {
    var res = await http.get(
        'http://192.168.0.200/Vipin/AdminUser/index.php/Connector/encode_data');

    setState(() {
      responseJson = jsonDecode(res.body.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 1,
        childAspectRatio: 2/1,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(responseJson.length, (index) {
          return Center(

            child:
            Container(
              padding: const EdgeInsets.fromLTRB(0,35,0,0),
                margin: EdgeInsets.all(20),
                height: 150,
                width:360.0,
                color: Colors.amber[100],
                child:Column(

                  children: [

                    Text(responseJson[index]['firstname']),
                    Text(responseJson[index]['lastname']),
                    Text(responseJson[index]['mobile']),
                    Text(responseJson[index]['gender']),

                  ],
                )
            ),
          );
        }),
      ),
    );
  }
}

