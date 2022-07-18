import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

SharedPreferences prefs;
const Color primaryColor = Color(0xad39a5e8);
const String token = "ww";
final String path_api = "http://169.254.145.169:8080/flutterrestaurant/api/";
final String path_images = "http://169.254.145.169:8080/flutterrestaurant/images/";
String G_use_id_val = "";
final String G_use_id = "use_id";
final String G_use_name = "use_name";
final String G_use_mobile = "use_mobile";
final String G_use_pwd="use_pwd";
final String G_use_image = "use_image";
final String G_use_note = "use_note";
Future<bool> checkConnection() async {
  try {
    return true;
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
