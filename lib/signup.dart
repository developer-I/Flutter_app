import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:flutter/services.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';



class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;





  final _formKey = GlobalKey<FormState>();
  User user = new User();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  senddata(var emaili, var passi, var fnamei, var lnamei, var genderi,
      var mobilei) async {
    setState(() {

      visible = true;

    });



    final response = await http.get(
        "http://192.168.0.200/Vipin/AdminUser/index.php/Connector/App_insert_data?email=$emaili&pass=$passi&fname=$fnamei&lname=$lnamei&gender=$genderi&mobile=$mobilei");

    var datauser = json.encode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (datauser.isNotEmpty) {
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
      //resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              child: Column(children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
                        child: Text(
                          'Signup'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(260.0, 65.0, 0.0, 0.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFF92B7F)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
                    child: Form(
                      key: _formKey,
                      autovalidate: false,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            // controller: _email,

                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                // hintText: 'EMAIL',
                                // hintStyle: ,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0XFFF92B7F)))),
                            validator: (value) {
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              user._email = value;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            // controller: _pass,
                            key: _passwordFieldKey,
                            decoration: InputDecoration(
                                labelText: 'PASSWORD ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0XFFF92B7F)))),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            // controller: _cpass,
                            decoration: InputDecoration(
                                labelText: 'CONFIRM PASSWORD',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0XFFF92B7F)))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value != _passwordFieldKey.currentState.value) {
                                return 'Password do not match';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              user._cpass = value;
                            },
                            obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            // controller: _fname,
                            decoration: InputDecoration(
                                labelText: 'FIRST NAME',

                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0XFFF92B7F)))),
                            obscureText: false,

                            inputFormatters: [new LengthLimitingTextInputFormatter(10)],
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              user._fname = value;
                            },


                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            // controller: _lname,
                            decoration: InputDecoration(
                                labelText: 'LAST NAME',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0XFFF92B7F)))),
                            obscureText: false,

                            inputFormatters: [new LengthLimitingTextInputFormatter(10)],
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              user._lname = value;
                            },
                          ),

                    SizedBox(height: 10.0),
                    TextFormField(
                      // controller: _mobile,
                      decoration: InputDecoration(
                          labelText: 'MOBILE',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFFF92B7F)))),
                      obscureText: false,
                      inputFormatters: [
                        new WhitelistingTextInputFormatter(
                            new RegExp(r'^[0-9]*$')),
                        new LengthLimitingTextInputFormatter(10)
                      ],
                      validator: (value) {
                        if (!phoneRegex.hasMatch(value)) {
                          return 'Please enter valid phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        user._mobile = value;
                      },
                    ),
                          SizedBox(height: 20.0),
                          // TextField(


                              GenderPickerWithImage(
                                showOtherGender: true,
                                verticalAlignedText: false,
                                selectedGender: Gender.Male,
                                selectedGenderTextStyle: TextStyle(
                                    color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
                                unSelectedGenderTextStyle: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.normal),
                                onChanged: (Gender gender) {
                                  print(gender);
                                  user._gender = gender;
                                },
                                equallyAligned: true,
                                animationDuration: Duration(milliseconds: 300),
                                isCircular: true,
                                // default : true,
                                opacityOfGradient: 0.4,
                                padding: const EdgeInsets.all(3),
                                size: 50, //default : 40
                              ),
                            // controller: _gender,
                            // decoration: InputDecoration(
                            //     labelText: 'GENDER',
                            //     labelStyle: TextStyle(
                            //         fontFamily: 'Montserrat',
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.grey),
                            //     focusedBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(color: Colors.green))),
                            // obscureText: false,
                          // ),

                          SizedBox(height: 30.0),
                          Container(
                              // height: 40.0,
                              // child: Material(
                              //   borderRadius: BorderRadius.circular(20.0),
                              //   shadowColor: Colors.greenAccent,
                              //   color: Colors.green,
                              //   elevation: 7.0,
                              //   child: RaisedButton(
                              //     onPressed: () {
                              //         if (_formKey.currentState.validate()) {
                              //
                              //           _formKey.currentState.save();
                              //
                              //         } else {
                              //           print('Error');
                              //
                              //       }
                              //       //   final response = await http.post("http://192.168.0.200/Vipin/AdminUser/index.php/Connector/App_insert_data?");
                              //       // senddata(_email.text, _pass.text, _fname,
                              //       //     _lname.text, _gender.text, _mobile.text);
                              //     },
                              //     color: Colors.green,
                              //     textColor: Colors.white,
                              //     padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              //     child:
                              //         Text('Click Here To Register User Online'),
                              //   ),
                              // )
                            //============================================================================================

                            height: 50.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 0.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0.3, 1],
                                    colors: [
                                      Color(0xFFF58524),
                                      Color(0XFFF92B7F),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: InkWell(
                                onTap: () {
                                       if (_formKey.currentState.validate()) {
                                         print("Process data");
                                        _formKey.currentState.save();


                                         senddata(user._email, user._cpass, user._fname,
                                             user._lname,user._gender , user._mobile);
                                       } else {
                                             print('Error');
                                         }
                                },
                                child: Center(
                                  child: Text('Register'.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),
                              ),
                            ),


                            ),
                          Visibility(
                              visible: visible,
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: CircularProgressIndicator())),
                          SizedBox(height: 20.0),
                          Container(
                            height: 50.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
  final RegExp phoneRegex = new RegExp(r'^[6-9]\d{9}$');
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

}


class User {
  String _email ;
  String _pass ;
  String _cpass ;
  String _fname ;
  String _lname ;
  var _gender ;
  String _mobile ;
}