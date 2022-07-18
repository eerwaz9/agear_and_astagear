 import 'dart:convert';
import 'dart:io';
import 'package:ageer_admin/pages/core/component/progress.dart';
import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:ageer_admin/pages/model/category/category.dart';
import 'package:ageer_admin/pages/model/category/category_data.dart';
 import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:ageer_admin/pages/config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();}
class _AddCategoryState extends State<AddCategory> {
  bool isloading = false;
  var _formKey = GlobalKey<FormState>();
  TextEditingController txtcat_name = new TextEditingController();
  TextEditingController txtcat_name_en = new TextEditingController();



  Future<Map> SaveDataList(dynamic image,
      Map arrInsert, String urlPage, BuildContext context, String type) async {
    String url = path_api + "${urlPage}?token=" + token;
    http.Response respone = await http.post(url, body: arrInsert);
    print(respone.body);
    if (json.decode(respone.body)["code"] == "200") {
      Map arr = json.decode(respone.body.toString())["message"];
      print("success");
      return arr;
    } else {
      print("Failer");
      return null;
    }
  }
  saveDatacategory(context, LoadingControl load) async {
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
        "cat_name": txtcat_name.text,
        "cat_name_en": txtcat_name_en.text,

      };
      Map <String,dynamic>resArray = await SaveDataList(_image,
          arr,"category/insert_category.php", context, "insert");
      isloading = resArray != null ? true : false;
      if (isloading) {
        SharedPreferences sh = await SharedPreferences.getInstance();
        sh.setInt(G_cat_id, resArray["cat_id"]);
        sh.setString(G_cat_name, resArray["cat_name"]);
        sh.setString(G_cat_name_en, resArray["cat_name_en"]);
        sh.setString(G_cat_thumball, resArray["cat_thumball"]);
        sh.setString(G_cat_image, resArray["cat_image"]);
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
    super.dispose();
    txtcat_name.dispose();
    txtcat_name_en.dispose();
   ;
  }


  File _image;
  final picker = ImagePicker();
  Future getImageGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path.toString());
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path.toString());
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
          title: Text("اضافة تصنيف جديد"),
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
                              controller: txtcat_name,
                              decoration: InputDecoration(
                                  hintText: "اسم التصنيف",
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
                              controller: txtcat_name_en,
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
                                    saveDatacategory(context, load);
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
