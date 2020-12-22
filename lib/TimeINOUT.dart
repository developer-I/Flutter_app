import 'package:flutter/material.dart';

import 'Attendance.dart';
import 'logout.dart';

class TimeInOut extends StatefulWidget {
  var status;
  var currentdate;
  var email;
  TimeInOut(this.status, this.currentdate, this.email);

  @override
  _TimeInOutState createState() => _TimeInOutState(status, currentdate, email);
}

class _TimeInOutState extends State<TimeInOut> {
  var status;
  var currentdate;
  var email;
  _TimeInOutState(this.status, this.currentdate, this.email);

  @override
  Widget build(BuildContext context) {
    var responseJson;
    return Scaffold(
      // backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Color(0XFFF92B7F),
        title: Text(" Attendance "),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.logout), onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => logout()));
          })
        ],
      ),

      body: Container(
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            // image: new DecorationImage(
            //   image: new NetworkImage(""),
            //   fit: BoxFit.fill,
            // ),
            border: Border.all(
              color: Color(0xFFF58524),

              width: 6,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          // color: Colors.amber,

          margin: EdgeInsets.symmetric(horizontal: 105, vertical: 90),

          child: Column(
            children: [
              Padding(padding: new EdgeInsets.fromLTRB(0, 20, 0, 0)),
              CircleAvatar(
                radius: 80.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/3153203/pexels-photo-3153203.jpeg?cs=srgb&dl=pexels-canva-studio-3153203.jpg&fm=jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                    border: Border.all(
                      color: Color(0XFFF92B7F),
                      width: 3.0,
                    ),
                  ),
                ),
                // backgroundImage: NetworkImage("http://www.newsshare.in/wp-content/uploads/2/Profile-WhatsApp-DP-13.jpg"),
              ),
              Padding(padding: new EdgeInsets.fromLTRB(0, 40, 0, 0)),
              FlatButton(
                height: 50,
                minWidth: 140,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Color(0XFFF92B7F))),
                color: Colors.white,
                textColor: Color(0xFFF58524),
                padding: EdgeInsets.all(9.0),
                onPressed: () {
                  if (status == 'time in' || status == 'time out') {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        Attendance(email)), (Route<dynamic> route) => false);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Attendance(email)));
                  }
                },
                child: Text(
                  status.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
