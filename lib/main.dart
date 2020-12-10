import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'signup.dart';
import 'Userprofile.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var visible = false ;
  var responseJson;


  TextEditingController _emaill = new TextEditingController();
  TextEditingController _passl = new TextEditingController();

  var Email;


  senddata(var emaili ,var passi ) async {

    setState(() {
      visible = true ;
    });

    final response = await http.get("http://192.168.0.200/Vipin/AdminUser/index.php/Connector/App_insert_login_data?email=$emaili&pass=$passi");

    setState(() {
    responseJson = jsonDecode(response.body.toString());
    Email= responseJson[0]['id'];
    });

    print(responseJson[2]['id']);


    var datauser = json.decode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Successfully Inserted!!!!"),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage())
                  // );

                },
              ),
            ],
          );
        },
      );
    }


  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('Hello',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('There',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller:_emaill,
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller:_passl,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child:RaisedButton(
                              onPressed: (){

                                //   final response = await http.post("http://192.168.0.200/Vipin/AdminUser/index.php/Connector/App_insert_data?");
                                senddata(_emaill.text,_passl.text);
                              },
                              color: Colors.green,
                              textColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text('Click Here To Register User Online'),
                            ),
                          )),
                      // Container(
                      //   height: 40.0,
                      //   child: Material(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     shadowColor: Colors.greenAccent,
                      //     color: Colors.green,
                      //     elevation: 7.0,
                      //     child: GestureDetector(
                      //       onTap: () {
                      //         senddata(_emaill.text,_passl.text);
                      //       },
                      //       child: Center(
                      //         child: Text(
                      //           'LOGIN',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //               fontFamily: 'Montserrat'),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 20.0),
                      // Container(
                      //   height: 40.0,
                      //   color: Colors.transparent,
                      //   // child: Container(
                      //   //   decoration: BoxDecoration(
                      //   //       border: Border.all(
                      //   //           color: Colors.black,
                      //   //           style: BorderStyle.solid,
                      //   //           width: 1.0),
                      //   //       color: Colors.transparent,
                      //   //       borderRadius: BorderRadius.circular(20.0)),
                      //   //   // child: Row(
                      //   //   //   mainAxisAlignment: MainAxisAlignment.center,
                      //   //   //   children: <Widget>[
                      //   //   //     Center(
                      //   //   //       child:
                      //   //   //       ImageIcon(AssetImage('assets/facebook.png')),
                      //   //   //     ),
                      //   //   //     SizedBox(width: 10.0),
                      //   //   //     Center(
                      //   //   //       child: Text('Log in with facebook',
                      //   //   //           style: TextStyle(
                      //   //   //               fontWeight: FontWeight.bold,
                      //   //   //               fontFamily: 'Montserrat')),
                      //   //   //     )
                      //   //   //   ],
                      //   //   // ),
                      //   // ),
                      // )
                    ],
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New to User ?',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      //Navigator.of(context).pushNamed('/signup');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}