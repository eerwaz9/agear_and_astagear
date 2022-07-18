import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  Widget getTimeLine() {
    double heightCon = 80.0;
    return Container(
      color: Colors.amber[50],
      margin: EdgeInsets.only(top: 10.0, bottom: 80.0),
      child: Column(
        children: <Widget>[
          new Container(
              height: heightCon,
              child: TimelineTile(
                lineXY: 0.2,
                indicatorStyle: IndicatorStyle(height: 1.0),
                alignment: TimelineAlign.manual,
                endChild: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        " تأكيد الطب لأيجار",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      new Icon(
                        Icons.baby_changing_station_rounded,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
              )),
          new Container(
              height: heightCon,
              child: TimelineTile(
                lineXY: 0.2,
                indicatorStyle: IndicatorStyle(height: 1.0),
                alignment: TimelineAlign.manual,
                endChild: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "تجهيز الطب  شيء المؤجر",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      new Icon(
                        Icons.baby_changing_station_rounded,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
              )),
          new Container(
              height: heightCon,
              child: TimelineTile(
                lineXY: 0.2,
                indicatorStyle: IndicatorStyle(height: 1.0),
                alignment: TimelineAlign.manual,
                endChild: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "تم تجهيز المؤجره الطلب  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                      new Icon(
                        Icons.baby_changing_station_rounded,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
              )),
          new Container(
              height: heightCon,
              child: TimelineTile(
                lineXY: 0.2,
                indicatorStyle: IndicatorStyle(height: 1.0),
                alignment: TimelineAlign.manual,
                endChild: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "الدليفري استلم الطلب",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                      new Icon(
                        Icons.baby_changing_station_rounded,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
              )),
          new Container(
              height: heightCon,
              child: TimelineTile(
                lineXY: 0.2,
                indicatorStyle: IndicatorStyle(height: 1.0),
                alignment: TimelineAlign.manual,
                endChild: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        " الدليفري قريب من المكان",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                      new Icon(

                          Icons.baby_changing_station_rounded,
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget getInfoDelivery() {
    return Container(
      child: ListTile(
        title: Text(
          "الاسم",
        ),
        subtitle: Text(
          "abdualaleem",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),
        ),
        leading: Container(
          width: 75.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/product/pro3.jpg"))),
        ),
        trailing: Container(
          width: 50.0,
          child: new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Icon(
                    Icons.star_border,
                    color: Colors.orange,
                  ),
                  new Text(
                    "5.0",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              new Text(
                "20000",
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "تتبع الطلب الإيجار",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          InkWell(
              onTap: () {},
              child: Row(
                children: <Widget>[
                  new Text(
                    "محادثة",
                    style: TextStyle(color: Colors.orange, fontSize: 20.0),
                  ),
                  new Icon(
                    Icons.chat,
                    color: Colors.orange,
                  ),
                ],
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30.0)),
          new Text(
            "الوقت المقدر لاستلام الطلب لايجار",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          new Text("05:30:00",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange)),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Divider(
              color: Colors.orange[200],
            ),
          ),
          getInfoDelivery(),
          getTimeLine(),
        ],
      ),
      bottomNavigationBar: Container(
        child: MaterialButton(
          onPressed: () {},
          child: new Container(
            padding: EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "الغاء الطلبية",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
