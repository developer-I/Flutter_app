import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'Userlogs.dart';
import 'logout.dart';


void main() {
  runApp(reports());
}

class reports extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: employeeReports(),
    );
  }
}

class employeeReports extends StatefulWidget {
  @override
  _employeeReports createState() => _employeeReports();
}

class _employeeReports extends State<employeeReports> {
  var rlength = 0;
  var Email;
  var responseJson;
  var jum = 2;



_employeeReports() {
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

       return Scaffold(
         appBar: AppBar(
           automaticallyImplyLeading: false,
           backgroundColor: Color(0XFFF92B7F),
           title: Text(" Profile "),
           centerTitle: true,
           actions: [
             IconButton(
               icon: Icon(Icons.logout),
               tooltip: "Logout",
               onPressed: () {
                 // Navigator.of(context).pushNamedAndRemoveUntil('/logout', (Route<dynamic> route) => false);
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                     logout()), (Route<dynamic> route) => false);

                 // Navigator.pushAndRemoveUntil(
                 //   MaterialPageRoute(builder: (BuildContext context) => logout()),
                 //   ModalRoute.withName('/'),);

                 // Navigator.push(context,
                     // MaterialPageRoute(builder: (context) => logout()));
               },
             )


           ],
         ),
         body: new Swiper(
           itemBuilder: (BuildContext context, int index) {
             return new Container(
               child: Column(
                 children: [
                   Padding(padding: new EdgeInsets.fromLTRB(0, 30, 0, 0)),
                   Container(

                     width: MediaQuery
                         .of(context)
                         .size
                         .width * 0.89,
                     height: MediaQuery
                         .of(context)
                         .size
                         .height * 0.26,
                     padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                     child: Card(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                       color: Color(0xFFF58524),

                       elevation: 10,
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: <Widget>[
                           Padding(
                             padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                           ),
                           Container(
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
                           Padding(
                             padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                           ),
                           Container(
                             child: Center(
                               child: Text(
                                   responseJson[index]['firstname'] +
                                       " " +
                                       responseJson[index]['lastname'],
                                   style: TextStyle(
                                       fontSize: 30.0,
                                       fontWeight: FontWeight.bold)),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                   Padding(
                     padding: new EdgeInsets.fromLTRB(0, 20, 0, 0),
                   ),
                   Container(
                     width: MediaQuery
                         .of(context)
                         .size
                         .width * 0.92,
                     height: MediaQuery
                         .of(context)
                         .size
                         .height * 0.50,
                     padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                     child: Card(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                       color: Color(0xFFF58524),
                       elevation: 10,
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: <Widget>[
                           Padding(
                             padding: new EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                           ),
                           Container(
                             child: Row(
                               children: [
                                 Padding(
                                   padding: new EdgeInsets.fromLTRB(
                                       25, 0, 0, 0),
                                 ),
                                 Text(" Designation : ",
                                     style: TextStyle(
                                         fontSize: 20.0,
                                         fontWeight: FontWeight.bold)),
                                 Text(responseJson[index]['designation'],
                                     style: TextStyle(
                                       fontSize: 20.0,
                                     )),
                               ],
                             ),
                           ),
                           Padding(
                             padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                           ),
                           Container(
                             child: Row(
                               children: [
                                 Padding(
                                   padding: new EdgeInsets.fromLTRB(
                                       25, 0, 0, 0),
                                 ),
                                 Text(" Mobile : ",
                                     style: TextStyle(
                                         fontSize: 20.0,
                                         fontWeight: FontWeight.bold)),
                                 Text(responseJson[index]['mobile'],
                                     style: TextStyle(
                                       fontSize: 20.0,
                                     )),
                               ],
                             ),
                           ),
                           Padding(
                             padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                           ),
                           Container(
                             child: Row(
                               children: [
                                 Padding(
                                   padding: new EdgeInsets.fromLTRB(
                                       25, 0, 0, 0),
                                 ),
                                 Text(" Gender : ",
                                     style: TextStyle(
                                         fontSize: 20.0,
                                         fontWeight: FontWeight.bold)),
                                 Text(responseJson[index]['gender'],
                                     style: TextStyle(
                                       fontSize: 20.0,
                                     )),
                               ],
                             ),
                           ),
                           Padding(
                             padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                           ),
                           Container(
                             child: Row(
                               children: [
                                 Padding(
                                   padding: new EdgeInsets.fromLTRB(
                                       25, 0, 0, 0),
                                 ),
                                 Text(" Password : ",
                                     style: TextStyle(
                                       fontSize: 20.0,
                                       fontWeight: FontWeight.bold,
                                     )),
                                 Text(responseJson[index]['password'],
                                     style: TextStyle(
                                       fontSize: 20.0,
                                     )),
                               ],
                             ),
                           ),

                           /**============================================================================== */
                           Padding(
                             padding: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                           ),
                           Card(
                             margin: EdgeInsets.symmetric(
                                 horizontal: 20.0, vertical: 5.0),
                             clipBehavior: Clip.antiAlias,
                             color: Colors.transparent,
                             elevation: 1.0,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(
                                   horizontal: 2.0, vertical: 20.0),
                               child: Row(
                                 children: <Widget>[
                                   Expanded(
                                     child: Column(
                                       children: <Widget>[
                                         Text(
                                           "Over - T",
                                           style: TextStyle(
                                             color: Colors.redAccent,
                                             fontSize: 22.0,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),
                                         SizedBox(
                                           height: MediaQuery
                                               .of(context)
                                               .size
                                               .height * 0.0,
                                         ),
                                         Text(
                                           "00",
                                           style: TextStyle(
                                             fontSize: 20.0,
                                             color: Colors.pinkAccent,
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Expanded(
                                     child: Column(
                                       children: <Widget>[
                                         Text(
                                           "Under - T",
                                           style: TextStyle(
                                             color: Colors.redAccent,
                                             fontSize: 22.0,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),
                                         SizedBox(
                                           height: MediaQuery
                                               .of(context)
                                               .size
                                               .height * 0.0,
                                         ),
                                         Text(
                                           "2h",
                                           style: TextStyle(
                                             fontSize: 20.0,
                                             color: Colors.pinkAccent,
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   // Expanded(
                                   //   child: Column(
                                   //     children: <Widget>[
                                   //       Text(
                                   //         "Follow",
                                   //         style: TextStyle(
                                   //           color: Colors.redAccent,
                                   //           fontSize: 22.0,
                                   //           fontWeight: FontWeight.bold,
                                   //         ),
                                   //       ),
                                   //       SizedBox(
                                   //         height: 5.0,
                                   //       ),
                                   //       Text(
                                   //         "1300",
                                   //         style: TextStyle(
                                   //           fontSize: 20.0,
                                   //           color: Colors.pinkAccent,
                                   //         ),
                                   //       )
                                   //     ],
                                   //   ),
                                   // ),
                                 ],
                               ),
                             ),
                           ),
                           //         ],
                           //       ),
                           //     ),
                           //   )
                           // )
                           /**============================================================================== */
                           /**============================================================================== */
                           Padding(
                             padding: new EdgeInsets.fromLTRB(0, 0.5, 0, 0),
                           ),
                           Card(
                             margin: EdgeInsets.symmetric(
                                 horizontal: 20.0, vertical: 5.0),
                             clipBehavior: Clip.antiAlias,
                             color: Colors.transparent,
                             elevation: 0.0,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(
                                   horizontal: 2.0, vertical: 20.0),
                               child: Container(

                                   height: 60,
                                   alignment: Alignment.centerLeft,
                                   decoration: BoxDecoration(
                                     gradient: LinearGradient(
                                       begin: Alignment.topLeft,
                                       end: Alignment.bottomRight,
                                       stops: [0.1, 1.0],
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
                                         "Logs",
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
                                                 builder: (context) => UserLogs(responseJson[index]['email'])));

                                       },
                                     ),
                                   )
                               ),

                               // child: Row(
                               //   children: <Widget>[
                                   // Expanded(
                                   //   child: Column(
                                   //     children: <Widget>[
                                   //       Text(
                                   //         "UNDER-TIME",
                                   //         style: TextStyle(
                                   //           color: Colors.redAccent,
                                   //           fontSize: 22.0,
                                   //           fontWeight: FontWeight.bold,
                                   //         ),
                                   //       ),
                                   //       SizedBox(
                                   //         height: MediaQuery
                                   //             .of(context)
                                   //             .size
                                   //             .height * 0.0,
                                   //       ),
                                   //       Text(
                                   //         "5200",
                                   //         style: TextStyle(
                                   //           fontSize: 20.0,
                                   //           color: Colors.pinkAccent,
                                   //         ),
                                   //       )
                                   //     ],
                                   //   ),
                                   // ),
                                   // Expanded(
                                   //   child: Column(
                                   //     children: <Widget>[
                                   //       Text(
                                   //         "OVER-TIME",
                                   //         style: TextStyle(
                                   //           color: Colors.redAccent,
                                   //           fontSize: 22.0,
                                   //           fontWeight: FontWeight.bold,
                                   //         ),
                                   //       ),
                                   //       SizedBox(
                                   //         height: MediaQuery
                                   //             .of(context)
                                   //             .size
                                   //             .height * 0.0,
                                   //       ),
                                   //       Text(
                                   //         "28.5K",
                                   //         style: TextStyle(
                                   //           fontSize: 20.0,
                                   //           color: Colors.pinkAccent,
                                   //         ),
                                   //       )
                                   //     ],
                                   //   ),
                                   // ),
                                   // Expanded(
                                   //   child: Column(
                                   //     children: <Widget>[
                                   //       Text(
                                   //         "Follow",
                                   //         style: TextStyle(
                                   //           color: Colors.redAccent,
                                   //           fontSize: 22.0,
                                   //           fontWeight: FontWeight.bold,
                                   //         ),
                                   //       ),
                                   //       SizedBox(
                                   //         height: 5.0,
                                   //       ),
                                   //       Text(
                                   //         "1300",
                                   //         style: TextStyle(
                                   //           fontSize: 20.0,
                                   //           color: Colors.pinkAccent,
                                   //         ),
                                   //       )
                                   //     ],
                                   //   ),
                                   // ),
                               //   ],
                               // ),
                             ),

                           )
                           //         ],
                           //       ),
                           //     ),
                           //   )
                           // )

                           /**============================================================================== */
                         ],
                       ),
                     ),
                   ),

                 ],
               ),
             );

           },

           itemCount: rlength,


           viewportFraction: 0.8,
           scale: 0.9,
         ),
         // floatingActionButton: FloatingActionButton(
         //   onPressed: null,
         //   tooltip: 'Increment',
         //   child: Icon(Icons.add),
         // ), // This trailing comma makes auto-formatting nicer for build methods.
       );

     }
  }
}
