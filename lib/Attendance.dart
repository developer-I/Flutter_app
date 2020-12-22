import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'TimeINOUT.dart';

class Attendance extends StatefulWidget {
  var email;

  Attendance(this.email);
  @override
  _Attendance createState() => _Attendance(email);
}

class _Attendance extends State<Attendance> {
  // int _counter = 0;
  var email;
  File _image;
  var uid;
  var CDate;

  _Attendance(this.email){
    getImage();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    GallerySaver.saveImage(image.path);
    // print(image.path);
    _uploadFile(image);

    setState(() {
      _image = image;
    });
  }

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // Methode for file upload
  void _uploadFile(filePath) async {
    // Get base file name
    String fileName = basename(filePath.path);
    final response = await http.get(
        "http://192.168.0.200/Vipin/AdminUser/index.php/Connector/TimeInOut_phone?email=$email&image=$fileName");
    var responseJson = jsonDecode(response.body.toString());

    setState(() async {
      uid = responseJson['id'];
      CDate = responseJson['Cdate'];

      setInOut();
    });
  }

  setInOut() async {
    final response1 = await http.get(
        "http://192.168.0.200/Vipin/AdminUser/index.php/Connector/Insert_timeinout?id=$uid&date=$CDate");

    setState(() {
      var responseJson = jsonDecode(response1.body.toString());

      // print(responseJson['id']);
      // print(responseJson['date']);

      var status = responseJson['status'];
      var currenttime = responseJson['currenttime'];

      // print(status);
      // print(currenttime);
      Navigator.push(
          this.context,
          MaterialPageRoute(
              builder: (context) => TimeInOut(status, currenttime, email)));
      // TimeInOut(status,currentdate,email);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // return Scaffold(
    //   appBar: AppBar(
    //     // Here we take the value from the MyHomePage object that was created by
    //     // the App.build method, and use it to set our appbar title.
    //     backgroundColor: Color(0XFFF92B7F),
    //     title: Text("Attendance"),
    //     centerTitle: true,
    //   ),
    //   body: Center(
    //     // Center is a layout widget. It takes a single child and positions it
    //     // in the middle of the parent.
    //     child: _image == null ? Text('No image selected.') : Image.file(_image),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: getImage,
    //     tooltip: 'Increment',
    //     child: Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );


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
