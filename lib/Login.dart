import 'main.dart';
import 'signup.dart';

import 'forgetPassword.dart';
import 'package:flutter/material.dart';



class loginUser extends StatefulWidget {
  @override
  _loginUserState createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {



  TextEditingController _emaill = new TextEditingController();
  TextEditingController _passl = new TextEditingController();

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
                              borderSide: BorderSide(color: Color(
                                  0XFFF92B7F)))),
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
                              borderSide: BorderSide(color: Color(
                                  0XFFF92B7F)))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(_emaill.text, _passl.text)));
                                // m.setValues(_emaill.text, _passl.text);

                            // m.senddata(_emaill.text, _passl.text);
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
