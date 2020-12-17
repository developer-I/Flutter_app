import 'dart:convert';
import 'signup.dart';
import 'Userprofile.dart';
import 'adminUserProfile.dart';
import 'forgetPassword.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

  _MyHomePageState(){
    getStringValuesSF();
  }


  // var visible = false ;
  var responseJson;

  TextEditingController _emaill = new TextEditingController();
  TextEditingController _passl = new TextEditingController();

  var emailP ;
  var passP;

  addStringToSF(var emaili, var passi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emaili );
    prefs.setString('pass', passi );
  }


  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringEmail = prefs.getString('email');
    String stringPass = prefs.getString('pass');


    if(stringEmail != null  && stringPass != null){
      senddata(stringEmail,stringPass);
    }

  }



  senddata(var emaili, var passi) async {
    print("hiii my name is");
    final response = await http.get(
        "http://192.168.0.200/Vipin/AdminUser/index.php/Connector/App_insert_login_data?email=$emaili&pass=$passi");

    setState(() {
      responseJson = jsonDecode(response.body.toString());
    });

     print(responseJson['email']+" " + responseJson['pass']);
     print("abcd" + responseJson['status']);

    if (responseJson['status'] == 'true') {
      if (responseJson['designation'] == 'admin') {
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: new Text(' Login !!!!! '),
        //       actions: <Widget>[
        //         FlatButton(
        //           child: new Text("OK"),
        //           onPressed: () {
        //
        //
        //           },
        //         ),
        //       ],
        //     );
        //   },
        // );
        addStringToSF(emaili, passi);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => adminUserProfilePage(responseJson)));
      } else if (responseJson['designation'] == 'employee') {
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: new Text(' Login !!!!! '),
        //       actions: <Widget>[
        //         FlatButton(
        //           child: new Text("OK"),
        //           onPressed: () {
        //             Navigator.push(context,MaterialPageRoute(builder: (context) => UserProfilePage(responseJson)));
        //
        //           },
        //         ),
        //       ],
        //     );
        //   },
        // );
        addStringToSF(emaili, passi);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserProfilePage(responseJson)));
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Check your email or password & login again !!! '),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
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
                            color: Color(0XFFF92B7F))),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _emaill,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFFF92B7F)))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: _passl,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFFF92B7F)))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResetPassword()),
                          );
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Color(0XFFF92B7F),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                        // height: 40.0,
                        // child: Material(
                        //   borderRadius: BorderRadius.circular(20.0),
                        //   shadowColor: Colors.greenAccent,
                        //   color: Colors.green,
                        //   elevation: 7.0,
                        //   child: RaisedButton(
                        //     onPressed: () {
                        //
                        //
                        //       //   final response = await http.post("http://192.168.0.200/Vipin/AdminUser/index.php/Connector/App_insert_data?");
                        //       senddata(_emaill.text, _passl.text);
                        //     },
                        //     color: Colors.green,
                        //     textColor: Colors.white,
                        //     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        //     child: Text('Click Here Login'),
                        //   ),
                        // )
                      //========================================================================================


                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color(0xFFF58524),
                            Color(0XFFF92B7F),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: FlatButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            print('heloooo');
                            senddata(_emaill.text, _passl.text);
                          },
                        ),
                      ),
                    ),
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
                        color: Color(0XFFF92B7F),
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
