import 'dart:convert';


import 'package:ageer_admin/pages/core/component/progress.dart';
import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:ageer_admin/pages/core/users/users.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:ageer_admin/pages/config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';


class AddUsers extends StatefulWidget {
  @override
  _AddUsersState createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  bool isloading = false;
  bool checkActive = false;
  var _formKey = GlobalKey<FormState>();
  TextEditingController txtuse_name = new TextEditingController();
  TextEditingController txtuse_mobile = new TextEditingController();
  TextEditingController txtuse_pwd = new TextEditingController();
  TextEditingController txtuse_note = new TextEditingController();

  Future<Map> SaveDataList(
      Map arrInsert, String urlPage, BuildContext context, String type) async {
    String url = path_api + "${urlPage}?token=" + token;
    http.Response respone = await http.post(url, body: arrInsert);
    print(respone.body);
    if (json.decode(respone.body)["code"] == "200") {
      Map arr = json.decode(respone.body)["message"];

      print("success");
      return arr;
    } else {
      print("Failer");
      return null;
    }
  }
  saveDatausetomer(context, LoadingControl load) async {
    if (!await checkConnection()) {
      Toast.show("Not connected Internet", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    bool myvalid = _formKey.currentState.validate();
    load.add_loading();
    if (myvalid) {
      isloading = true;
      load.add_loading();
      Map arr = {
        "use_name": txtuse_name.text,
        "use_mobile": txtuse_mobile.text,
        "use_pwd": txtuse_pwd.text,
        "use_active": checkActive ? "1" : "0",
        "use_note": txtuse_note.text,
      };
      Map resArray = await SaveDataList(
           arr,"users/insert_user.php", context, "insert");
      isloading = resArray != null ? true : false;
      if (isloading) {
        SharedPreferences sh = await SharedPreferences.getInstance();
        sh.setInt(G_use_id, resArray["use_id"]);
        sh.setString(G_use_name, resArray["use_name"]);
        sh.setString(G_use_mobile, resArray["use_mobile"]);
        sh.setString(G_use_pwd, resArray["use_pwd"]);
        sh.setString(G_use_image, resArray["use_image"]);
        sh.setString(G_use_note, resArray["use_note"]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Users()));
      }
      /*await createData(
          arr, "delivery/insert_delivery.php", context, () => Delivery());*/

      load.add_loading();
    } else {
      Toast.show("Please fill data", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  @override
    @override
  void dispose() {
    super.dispose();
    txtuse_name.dispose();
    txtuse_mobile.dispose();
    txtuse_pwd.dispose();
    txtuse_note.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("اضافة مستخدم جديد"),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Consumer<LoadingControl>(builder: (context, load, child) {
                  return Expanded(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtuse_name,
                              decoration: InputDecoration(
                                  hintText: "اسم المستخدم",
                                  border: InputBorder.none),
                              validator: (value) {
                                if (value.isEmpty) {
                                  print("enyter name");
                                  return "الرجاء ادخال الاسم ";
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtuse_mobile,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "الموبايل",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty || value.length < 5) {
                                  return "الرجاء ادخال رقم الموبايل";
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtuse_pwd,
                              decoration: InputDecoration(
                                  hintText: "الباسورد",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty || value.length < 5) {
                                  return "الرجاء ادخال الباسورد ";
                                }
                              },
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Checkbox(
                                  value: checkActive,
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkActive = newValue;
                                    });
                                  })),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtuse_note,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "الملاحظات",
                                  border: InputBorder.none),
                            ),
                          ),
                          isloading
                              ? circularProgress()
                              : MaterialButton(
                                  onPressed: () {
                                    saveDatausetomer (context,load);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "حفظ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 10.0, top: 30.0),
                                    padding: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                  )),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
