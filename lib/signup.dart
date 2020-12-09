import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Userprofile.dart';



class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

 class _SignupPageState extends State<SignupPage> {

   // Boolean variable for CircularProgressIndicator.
   bool visible = false ;

   TextEditingController _email = new TextEditingController();
   TextEditingController _pass = new TextEditingController();
   TextEditingController _cpass = new TextEditingController();
   TextEditingController _fname = new TextEditingController();
   TextEditingController _lname = new TextEditingController();
   TextEditingController _gender = new TextEditingController();TextEditingController _mobile = new TextEditingController();


    senddata(var emaili ,var passi ,var fnamei ,var lnamei , var genderi , var mobilei) async {

      setState(() {
        visible = true ;
      });

      final response = await http.get("http://192.168.0.200/Vipin/AdminUser/index.php/Connector/App_insert_data?email=$emaili&pass=$passi&fname=$fnamei&lname=$lnamei&gender=$genderi&mobile=$mobilei");


     var datauser = json.encode(response.body);

      // If Web call Success than Hide the CircularProgressIndicator.
      if(response.statusCode == 200){
        setState(() {
          visible = false;
        });
      }

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(datauser),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Userprofile())
                  );

                },
              ),
            ],
          );
        },
      );


  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
              child: Container(
                child: Column( children: <
                    Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                          child: Text(
                            'Signup',
                            style:
                            TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                          child: Text(
                            '.',
                            style: TextStyle(
                                fontSize: 80.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller:_email,
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                // hintText: 'EMAIL',
                                // hintStyle: ,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller:_pass,
                            decoration: InputDecoration(
                                labelText: 'PASSWORD ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller:_cpass,
                            decoration: InputDecoration(
                                labelText: 'CONFIRM PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller:_fname,
                            decoration: InputDecoration(
                                labelText: 'FIRST NAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            obscureText: false,
                          ),



                          SizedBox(height: 10.0),
                          TextField(
                            controller:_lname,
                            decoration: InputDecoration(
                                labelText: 'LAST NAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            obscureText: false,
                          ),

                          SizedBox(height: 10.0),
                          TextField(
                            controller:_gender,
                            decoration: InputDecoration(
                                labelText: 'GENDER',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            obscureText: false,
                          ),

                          SizedBox(height: 10.0),
                          TextField(
                            controller:_mobile,
                            decoration: InputDecoration(
                                labelText: 'MOBILE',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            obscureText: false,
                          ),
                          SizedBox(height: 50.0),
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
                                    senddata(_email.text,_pass.text,_fname.text,_lname.text,_gender.text,_mobile.text);
                                  },
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text('Click Here To Register User Online'),
                                ),
                              )),
                          Visibility(
                              visible: visible,
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: CircularProgressIndicator()
                              )
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child:

                                Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),


                              ),
                            ),
                          ),
                        ],
                      )),
                  // SizedBox(height: 15.0),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Text(
                  //       'New to Spotify?',
                  //       style: TextStyle(
                  //         fontFamily: 'Montserrat',
                  //       ),
                  //     ),
                  //     SizedBox(width: 5.0),
                  //     InkWell(
                  //       child: Text('Register',
                  //           style: TextStyle(
                  //               color: Colors.green,
                  //               fontFamily: 'Montserrat',
                  //               fontWeight: FontWeight.bold,
                  //               decoration: TextDecoration.underline)),
                  //     )
                  //   ],
                  // )
                ]),
              ),
            ),
          ),
        ),
    );
  }


}


