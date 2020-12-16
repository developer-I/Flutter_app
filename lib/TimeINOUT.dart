import 'package:flutter/material.dart';

import 'Attendance.dart';

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
        backgroundColor: Colors.lightGreen,
        title: Text("Attendance"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: null)
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
              color: Colors.green,
              width: 6,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          // color: Colors.amber,

          margin: EdgeInsets.symmetric(horizontal: 80, vertical: 60),

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
                      color: Colors.green,
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
                    side: BorderSide(color: Colors.green)),
                color: Colors.white,
                textColor: Colors.red,
                padding: EdgeInsets.all(9.0),
                onPressed: () {
                  if (status == 'time in' || status == 'time out') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Attendance(email)));
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
