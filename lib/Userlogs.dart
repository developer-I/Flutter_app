import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'logout.dart';
import 'package:http/http.dart' as http;

class UserLogs extends StatefulWidget {
  var email;
  var fname;
  UserLogs(this.email,this.fname);
  @override
  _UserLogsState createState() => _UserLogsState(email,fname);
}

class _UserLogsState extends State<UserLogs> {
  var Data;
  var emaili;
  var fname;
  var rlength = 0;
  var timein;
  List<dynamic> responseJson ;

  _UserLogsState(this.emaili,this.fname){

    initplatformstate();
  }


    Future initplatformstate() async {

    print("hello my name is");
    print(emaili);
    final res = await http.get("http://192.168.0.200/Vipin/AdminUser/index.php/Connector/UserLogs?email=$emaili");

    setState(() {
    responseJson = json.decode(res.body);


    // print(responseJson.length);
    });



  }







  @override
  Widget build(BuildContext context) {

    if(rlength == 0){

      initplatformstate();


      Timer(Duration(seconds: 2), () {
        rlength = responseJson.length;

      });
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





    }else {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.logout, color: Colors.black), tooltip: "Logout",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => logout()));
              },
            ),
            backgroundColor: Color(0XFFF92B7F),
            title: Text(fname + " - Logs "),
            centerTitle: true,
          ),


          body: ListView.builder(
              itemCount: responseJson.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (BuildContext context, int index) {
                return new Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Text(responseJson[index]['Cdate'] ,style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xFFF58524),

                      elevation: 10,
                      child: Row(

                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                          ),
                          new Expanded(
                            flex: 1,

                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.40,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0XFFF92B7F),
                                    //                   <--- border color
                                    width: 5.0,
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.pexels.com/photos/4050289/pexels-photo-4050289.jpeg?cs=srgb&dl=pexels-vlada-karpovich-4050289.jpg&fm=jpg'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                          ),
                          Padding(
                            padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                          ),
                          new Expanded(
                              flex: 1,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    // responseJson[index]['firstname'] +
                                    //     " " +
                                    //     responseJson[index]['lastname'],
                                      responseJson[index]['timein'],
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),

                          ),


                          //===============================================================

                          Padding(
                            padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                          ),
                          new Expanded(
                            flex: 1,

                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.40,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0XFFF92B7F),
                                  //                   <--- border color
                                  width: 5.0,
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.pexels.com/photos/4050289/pexels-photo-4050289.jpeg?cs=srgb&dl=pexels-vlada-karpovich-4050289.jpg&fm=jpg'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Padding(
                            padding: new EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                          ),
                          new Expanded(

                            flex: 1,
                            child: Container(
                              child: Center(
                                child: Text(
                                  // responseJson[index]['firstname'] +
                                  //     " " +
                                  //     responseJson[index]['lastname'],
                                      responseJson[index]['timeout'] ,

                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),

                          ),




                        ],
                      ),
                    ),


                  ],
                );
              }),
        ),
      );
    }
  }
}
