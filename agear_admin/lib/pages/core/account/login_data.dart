import 'dart:convert';
import 'package:ageer_admin/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ageer_admin/pages/config.dart';
import 'dart:async';

Future<bool> loginUsers(
    String use_mobile, String use_pwd, BuildContext context) async {
  String url = path_api +
      "users/login.php?use_mobile=" +
       use_mobile +
      "&use_pwd=" +
      use_pwd +
      "&token=" +
      token;
  http.Response respone = await http.get(url);
  if (json.decode(respone.body)["code"] == "200") {
    Map arr = json.decode(respone.body)["message"];
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setInt(G_use_id, arr["use_id"]);
    sh.setString(G_use_name, arr["use_name"]);
    sh.setString(G_use_image, arr["use_image"]);
    sh.setString(G_use_mobile, arr["use_mobile"]);
    sh.setString(G_use_note, arr["use_note"]);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
   print(arr);
   print(sh);
    print("success");
    return true;
  } else {
    print("Failer");
    return false;
  }
}
