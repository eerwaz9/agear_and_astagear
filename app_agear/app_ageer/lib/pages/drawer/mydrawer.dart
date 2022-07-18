import 'package:flutter/material.dart';
import 'package:restaurant/pages/account/changepassword.dart';
import 'package:restaurant/pages/account/login.dart';
import 'package:restaurant/pages/account/myprofile.dart';
import 'package:restaurant/pages/bill/bill.dart';
import 'package:restaurant/pages/delivery/add.dart';
import 'package:restaurant/pages/favorite/favorite.dart';
import 'package:restaurant/pages/order/tracking.dart';
import 'package:restaurant/pages/product/category.dart';
import 'package:restaurant/pages/shopping/shopping.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  logout(context) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove(G_cus_id);
    sh.remove(G_cus_name);
    sh.remove(G_cus_image);
    sh.remove(G_cus_mobile);
    sh.remove(G_cus_email);
    sh.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "APPA",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                accountEmail: Text(
                  "Abdualaleem@gmail.com",
                  style: TextStyle(color: Colors.grey),
                ),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.lime,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.orange[200]),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "الصفحة الرئيسية",

                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.home,
                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Category()));
                      },
                      child: ListTile(
                        title: Text(
                          "قائمة لأيجارات",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.account_balance_sharp,
                          color: Colors.orange,
                        ),
                        trailing: Icon(

                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),

              Theme(
                data: theme,
                child: ExpansionTile(
                  title: Text(
                    "حسابي",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  children: <Widget>[
//======================child account
                    Container(
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => new MyProfile()));
                            },
                            child: ListTile(
                              title: Text(
                                "تغيير الاعدادات الشخصية",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                              leading: Icon(
                                Icons.settings,
                                color: Colors.orange,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.orange[500],
                          ),
                          Divider(
                            color: Colors.greenAccent,
                            height: 0,
                            thickness: 0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          new ChangePassword()));
                            },
                            child: ListTile(
                              title: Text(
                                "تغيير كلمة المرور",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                              leading: Icon(
                                Icons.lock_open,
                                color: Colors.orange,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //======================end child account
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Divider(
                  color: Colors.orange[500],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Favorite()));
                      },
                      child: ListTile(
                        title: Text(
                          "مفضلاتي",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.favorite,
                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Shopping()));
                      },
                      child: ListTile(
                        title: Text(
                          " الطلب ايجار سلة التسوق",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.add_shopping_cart_sharp,
                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Bill()));
                      },
                      child: ListTile(
                        title: Text(
                          "طلبات المؤستئاجره",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.history,

                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new AddDelivery()));
                      },
                      child: ListTile(
                        title: Text(
                          "إضافة إيجار جديد",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.add_business_outlined,
                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Tracking()));
                      },
                      child: ListTile(
                        title: Text(
                          "تتبع الطلبية المؤستئاجره",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.drive_eta,
                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "من نحن",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.message,
                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "مركز الدعم",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.phone,
                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                    Divider(
                      color: Colors.greenAccent,
                      height: 0,
                      thickness: 0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        logout(context);
                      },
                      child: ListTile(
                        title: Text(
                          "خروج",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          Icons.phone,
                          color: Colors.orange,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.orange[500],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.greenAccent,
                height: 10,
                thickness: 2,
              ),

            ],
          ),
        ),
      ),

    );

  }
}
