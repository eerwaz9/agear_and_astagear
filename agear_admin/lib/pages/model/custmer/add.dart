import 'dart:io';

 import 'package:ageer_admin/pages/core/component/progress.dart';
import 'package:ageer_admin/pages/core/provider/loading.dart';

import 'package:flutter/material.dart';
import 'package:ageer_admin/pages/config.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../function.dart';

import 'custmur.dart';
import 'custmur_data.dart';


class AddCustmur extends StatefulWidget {
  @override
  _AddCustmurState createState() => _AddCustmurState();
}

class _AddCustmurState extends State<AddCustmur> {
  bool isloading = false;

  var _formKey = GlobalKey<FormState>();
  TextEditingController txtcus_name = new TextEditingController();
  TextEditingController txtcus_pwd = new TextEditingController();
  TextEditingController txtcus_mobile = new TextEditingController();
  TextEditingController txtcus_email = new TextEditingController();

  saveData(context, LoadingControl load) async {
    if (!await checkConnection()) {
      Toast.show("Not connected Internet", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    bool myvalid = _formKey.currentState.validate();
    load.add_loading();
    if (txtcus_name.text.isNotEmpty && txtcus_pwd.text.isNotEmpty && myvalid) {
      isloading = true;
      load.add_loading();
      Map arr = {
        "cus_name": txtcus_name.text,
        "cus_pwd": txtcus_pwd.text,
        "cus_mobile": txtcus_mobile.text,
        "cus_email": txtcus_email.text,
      };

      Map<String,dynamic> res = await SaveDataList(_image, arr,
          "customer/insert_customer.php", context, () => Customer(), "insert");
      /*await createData(
          arr, "delivery/insert_delivery.php", context, () => Delivery());*/
      isloading = res != null ? true : false;
      if (isloading) {
        SharedPreferences sh = await SharedPreferences.getInstance();
        sh.setString(G_cus_id,res["cus_id"]);
        sh.setString(G_cus_name, res["cus_name"]);
        sh.setString(G_cus_pwd, res["cus_pwd"]);
        sh.setString(G_cus_mobile, res["cus_mobile"]);
        sh.setString(G_cus_email, res["cus_email"]);
        sh.setString(G_cus_regdate, res["cus_regdate"]);
        sh.setString(G_cus_thumbnail, res["cus_thumbnail"]);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Customer()));
      }
      isloading = res as bool;
      load.add_loading();
    } else {
      Toast.show("Please fill data", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtcus_name.dispose();
    txtcus_pwd.dispose();
  }

  File _image;
  final picker = ImagePicker();
  Future getImageGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future getImageCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }
  void showSheetGallery(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              child: Wrap(
            children: [
              new ListTile(
                leading: new Icon(Icons.image),
                title: new Text("معرض الصور"),
                onTap: () {
                  getImageGallery();
                },
              ),
              new ListTile(
                leading: new Icon(Icons.camera),
                title: new Text("كاميرا"),
                onTap: () {
                  getImageCamera();
                },
              ),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("اضافة زبون جديد اوتعديل عليه"),
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
                              controller: txtcus_name,
                              decoration: InputDecoration(
                                  hintText: "الاسم ", border: InputBorder.none),
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
                              controller: txtcus_pwd,
                              decoration: InputDecoration(
                                  hintText: "الباسورد",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "الرجاء ادخال الباسورد ";
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
                              controller: txtcus_mobile,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "الموبايل",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "الرجاء ادخال الموبايل ";
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
                              controller: txtcus_email,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "الايميل ",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "الرجاء ادخال الايميل  ";
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.image,
                                  size: 60.0,
                                  color: Colors.orange[400],
                                ),
                                onPressed: () {
                                  showSheetGallery(context);
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: _image == null
                                ? new Text("الصورة غير محددة")
                                : new Image.file(
                                    _image,
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          isloading
                              ? circularProgress()
                              : MaterialButton(
                                  onPressed: () {
                                    saveData(context, load);
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
                                        color: Colors.red,
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
