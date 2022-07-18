import 'dart:convert';
import 'dart:io';

import 'package:ageer_admin/pages/core/component/progress.dart';
import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:ageer_admin/pages/model/category/category.dart';
import 'package:ageer_admin/pages/model/category/category_data.dart';
import 'package:flutter/material.dart';
import 'package:ageer_admin/pages/config.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart'as http;
import '../../function.dart';
import 'food.dart';
import 'food_data.dart';




class AddFood extends StatefulWidget {
   String cat_id;
  final String cat_name;
  AddFood({@required this.cat_id, @required this.cat_name});
  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  dynamic isloading = false;

  var _formKey = GlobalKey<FormState>();
  TextEditingController txtfoo_name = new TextEditingController();
  TextEditingController txtfoo_name_en = new TextEditingController();
  TextEditingController txtfoo_price = new TextEditingController();
  TextEditingController txtfoo_offer = new TextEditingController();
  TextEditingController txtfoo_info = new TextEditingController();
  TextEditingController txtfoo_info_en = new TextEditingController();


  saveDataFood(context, LoadingControl load) async {
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
        "cat_id": widget.cat_id,
        "foo_name": txtfoo_name.text,
        "foo_name_en": txtfoo_name_en.text,
        "foo_price": txtfoo_price.text,
        "foo_offer": txtfoo_offer.text,
        "foo_info": txtfoo_info.text,
        "foo_info_en": txtfoo_info_en.text,
      };
      Map<String,dynamic> resArray = await SaveDataList  (_image,
    arr,
    "food/insert_food.php",
    context, () => Food(
    cat_name: widget.cat_name, cat_id: widget.cat_id.toString(),), "insert");
      isloading = resArray != null ? 1 : 0;
      if (isloading) {
        SharedPreferences sh = await SharedPreferences.getInstance();
        sh.setString(G_foo_id, resArray["foo_id"]);
        sh.setString(D_cat_id, resArray["cat_id"]);
        sh.setString(G_foo_name, resArray["foo_name"]);
        sh.setString(G_foo_name_en, resArray["foo_name_en"]);
        sh.setString(G_foo_price, resArray["foo_price"]);
        sh.setString(G_foo_offer, resArray["foo_offer"]);
        sh.setString(G_foo_info, resArray["foo_info"]);
        sh.setString(G_foo_info, resArray["foo_info"]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Category()));
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtfoo_name.dispose();
    txtfoo_name_en.dispose();

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
          title: Text("اضافة مأكولات جديدة"),
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
                              controller: txtfoo_name,
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
                              controller: txtfoo_name_en,
                              decoration: InputDecoration(
                                  hintText: "الاسم بالانكليزي",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty) {
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
                              controller: txtfoo_price,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "السعر", border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "الرجاء ادخال السعر ";
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
                              controller: txtfoo_offer,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "الخصم", border: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtfoo_info,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "التفاصيل",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "الرجاء ادخال التفاصيل ";
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
                              controller: txtfoo_info_en,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "التفاصيل انكليزي",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "الرجاء ادخال التفاصيل انكليزي ";
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
                                  color: Colors.orange[300],
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
                                    saveDataFood(context, load);
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
