//
// import 'dart:convert';
// import 'package:http/http.dart'as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:restaurant/pages/home/home.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../config.dart';
//
// Future<bool> loginUsers(
//     String cus_mobile, String cus_pwd, BuildContext context) async {
//   String url = path_api +
//       "customer/login.php?cus_mobile=" +
//       cus_mobile +
//       "&cus_pwd=" +
//      cus_pwd +
//       "&token=" +
//       token;
//
//   http.Response respone = await http.get(url);
//   if (json.decode(respone.body)["code"] == "200") {
//     Map resArray = json.decode(respone.body)["message"];
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     sh.setString(G_cus_id, resArray["cus_id"].toString());
//     sh.setString(G_cus_name, resArray["cus_name"]);
//     sh.setString(G_cus_image, resArray["cus_image"]);
//     sh.setString(G_cus_mobile, resArray["cus_mobile"]);
//     sh.setString(G_cus_email, resArray["cus_email"]);
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => Home()));
//     print(resArray);
//     print(sh);
//     print("success");
//     return true;
//   } else {
//     print("Failer");
//     return false;
//   }
// }