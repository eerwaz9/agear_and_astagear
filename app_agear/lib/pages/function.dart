import "package:app_agear/pages/config.dart";
import 'package:app_agear/pages/model/product/productData.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'config.dart';
Future<bool> SaveData(Map arrInsert, String urlPage, BuildContext context,
    Widget Function() movePage, String type) async {
  try{
  String url = path_api + "${urlPage}?token=" + token;
  http.Response respone = await http.post(url, body: arrInsert);
  if (json.decode(respone.body)["code"] == "200") {
    if (type == "insert") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => movePage()));
    } else {
      Navigator.pop(context);
    }
    print("success");
    return true;
  } else {
    print("Failer");
    return false;
  }
}
catch(e){
    print(e);
}}
Future<Object> SaveDataList2(
    dynamic imageFile,
    Map arrInsert,
    String urlPage,
    BuildContext context,
    Widget Function() movePage,
    String type) async {
  if (imageFile == null) {
    await SaveData(arrInsert, urlPage, context, movePage, type);
    return false;
  }
  var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

  var length = await imageFile.length();
  String url = path_api + "${urlPage}?token=" + token;
  var uri = Uri.parse(url);
  print(uri.path);
  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile("file", stream, length,
      filename: basename(imageFile.path.toString()));
  for (var entry in arrInsert.entries) {
    request.fields[entry.key] = entry.value.toString();
  }
//////////////////عمل الاضافة

  print(multipartFile);
  var response = await request.send();
  request.files.add(multipartFile);
  if (response.statusCode == 200) {
    print("Send succefull");
    if (type == "update") {
      Navigator.pop(context);
    } else if (type == "insert") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => movePage()));
    }
    return true;
  } else {
    return false;

  }
}
Future<Map> SaveDataList(
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
Future<bool> uploadFileWithData(
    dynamic imageFile,
    Map arrInsert,
    String urlPage,
    BuildContext context,
    Widget Function() movePage,
    String type) async {
  if (imageFile == null) {
    await SaveData(arrInsert, urlPage, context, movePage, type);
    return false;
  }
  var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  String url = path_api + "${urlPage}?token=" + token;
  var uri = Uri.parse(url);
  print(uri.path);
  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile("file", stream, length,
      filename: basename(imageFile.path));
  for (var entry in arrInsert.entries) {
    request.fields[entry.key] = entry.value.toString();
  }
  request.files.add(multipartFile);
  var response = await request.send();
  if (response.statusCode == 200) {
    print("Send succefull");
    if (type == "update") {
      Navigator.pop(context);
    } else if (type == "insert") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => movePage()));
    }
    return true;
  } else {
    return false;
    print("not send");
  }
}

Future<List> getData(
    int start, int end, String urlPage, String strSearch, String param) async {
  String url = path_api +
      "${urlPage}?${param}txtsearch=${strSearch}&start=${start}&end=${end}&token=" + token;
  print(url);
  http.Response respone = await http.get(url);

  if (json.decode(respone.body)["code"] == "200") {
    {
      List arr = (json.decode(respone.body)["message"]);
      print(arr.length);
      return arr;
    }
  } else {
    return null;
  }
}

Future<bool> deleteData(String col_id, String val_id, String urlPage) async {
  String url = path_api + "${urlPage}?${col_id}=${val_id}&token=" + token;
  print(url);
  http.Response respone = await http.post(url);
  if (json.decode(respone.body)["code"] == "200") {
    return true;
  } else {
    return false;
  }
}
