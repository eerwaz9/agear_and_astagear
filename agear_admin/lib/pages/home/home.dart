 import 'package:ageer_admin/pages/config.dart';
import 'package:ageer_admin/pages/core/users/users.dart';
 import 'package:ageer_admin/pages/drawer/mydrawer.dart';
import 'package:ageer_admin/pages/model/category/category.dart';
import 'package:ageer_admin/pages/model/custmer/custmur.dart';
import 'package:ageer_admin/pages/model/delivery/delivery.dart';



import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("ادارة الايجارات"),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[100],
        endDrawer: MyDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Users()));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              children: <Widget>[
                                new Icon(
                                  Icons.home,
                                  size: 80.0,
                                  color: Colors.green,
                                ),
                                new Text(
                                  "المستخدمين",
                                  style: TextStyle(fontSize: 18.0),
                                )
                              ],
                            ),
                          ))),
                  new Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Category()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          new Icon(
                            Icons.category,
                            size: 80.0,
                            color: Colors.orange,
                          ),
                          new Text(
                            "التصنيفات",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Delivery()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: <Widget>[
                          new Icon(
                            Icons.fastfood,
                            size: 80.0,
                            color: Colors.red,
                          ),
                          new Text(
                            "الدليفري",
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  )),
                  new Expanded(
                      child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          Icons.message,
                          size: 80.0,
                          color: Colors.blue,
                        ),
                        new Text(
                          "الطلبيات",
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  )),
                ],
              ),

              Row(
                children: <Widget>[
                  new Expanded(
                      child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          Icons.notifications,
                          size: 80.0,
                          color: Colors.lime,
                        ),
                        new Text(
                          "الاشعارات",
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  )),
                  new Expanded(
                      child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: <Widget>[
                        new Icon(
                          Icons.access_alarms,
                          size: 80.0,
                          color: Colors.orange,
                        ),
                        new Text(
                          "الطلبيات قيد التنفيذ",
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Customer()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                            children: <Widget>[
                              new Icon(
                                Icons.manage_accounts_outlined,
                                size: 80.0,
                                color: Colors.blueAccent,
                              ),
                              new Text(
                                "الزبائن",
                                style: TextStyle(fontSize: 18.0),
                              )
                            ],
                          ),
                        ),
                      )),
                  new Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),

                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
