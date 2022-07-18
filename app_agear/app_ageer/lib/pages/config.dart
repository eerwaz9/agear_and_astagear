import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

SharedPreferences prefs;
const Color primaryColor = Color(0xffffa200);
const String token = "ww";
final String path_api = "http://192.168.164.1:8080/flutterrestaurant/api/";
final String path_images = "http://192.168.164.1:8080/flutterrestaurant/images/";
final String images_Category = path_images + "category/";
final String imagesFood = path_images + "food/";
final String currency = "ل.س";
String G_cus_id_val = "";
final  String G_cus_id = "cus_id";
final String G_cus_name = "cus_name";
final String G_cus_mobile = "cus_mobile";
final String G_cus_email = "cus_email";
final String G_cus_image = "cus_image";
// final String G_cus_latiute = "cus_latiute";
// final String G_cus_latuite = "cus_latuite";


// class CustomerData {
//   int cus_id;
//   String cus_name;
//   String cus_pwd;
//   String cus_mobile;
//   String cus_email;
//   String cus_regdate;
//   String cus_thumbnail;
//   double cus_latiute;
//   double cus_latuite;
//   CustomerData(
//       {this.cus_id,
//         this.cus_name,
//         this.cus_pwd,
//         this.cus_mobile,
//         this.cus_email,
//         this.cus_regdate,
//         this.cus_thumbnail
//         ,this.cus_latiute,
//         this.cus_latuite});
// }
Future<bool> checkConnection() async {
  try { return true;
    final result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("connect");
      return true;
    } else {
      print("not connect");
      return false;
    }
  } on SocketException catch (_) {
    print("not connect");
    return false;
  }
}

