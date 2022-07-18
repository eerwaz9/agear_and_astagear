// ignore_for_file: deprecated_member_use
import 'dart:ui';

import 'package:ageer_admin/pages/core/component/progress.dart';
import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:ageer_admin/pages/core/users/users_data.dart';
import 'package:flutter/material.dart';
import 'package:ageer_admin/pages/config.dart';
import 'package:ageer_admin/pages/function.dart';
import 'package:provider/provider.dart';

import 'add.dart';


class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  ScrollController myScroll;
  GlobalKey<RefreshIndicatorState> refreshKey;
  int i = 0;
  bool loadingList = false;
  void getDataUser(int count, String strSearch) async {
    loadingList = true;
    setState(() {});
    List arr = await getData(count, "users/readuser.php", strSearch, "");
   for (int i = 0; i < arr.length; i++) {
      userList.add(new UsersData(
        use_id: arr[i]["use_id "]    ,
        use_name: arr[i]["use_name"],
        use_pwd: arr[i]["use_pwd"],
        use_mobile: arr[i]["use_mobile"],
        checkActive : arr[i]["checkActive"] == "1" ? true : false,
        use_lastdatetime: arr[i]["use_lastdatetime"],
        use_note: arr[i]["use_note"],
      ));
      print(arr);
   }loadingList = false;setState(() {});}
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myScroll.dispose();
    userList.clear();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userList = new List<UsersData>();
    myScroll = new ScrollController();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    getDataUser(0, "");

    myScroll.addListener(() {
      if (myScroll.position.pixels == myScroll.position.maxScrollExtent) {
        i += 10;
        getDataUser(i, "");
        print("scroll");
      }
    });
  }
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text("ادارة اليوزر");
  void _searchPressed(LoadingControl myProv) {
    if (this._searchIcon.icon == Icons.search) {
      this._searchIcon = new Icon(Icons.close);
      this._appBarTitle = new TextField(
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            prefixIcon: Icon(Icons.search), hintText: "ابحث ..."),
        onChanged: (text) {
          print(text);
          userList.clear();
          i = 0;
          getDataUser(0, text);
          myProv.add_loading();
        },
      );
    } else {
      this._searchIcon = new Icon(Icons.search);
      this._appBarTitle = new Text("بحث باسم المستخدم");
    }
    myProv.add_loading();
  }

  @override
  Widget build(BuildContext context) {
   var myProvider = Provider.of<LoadingControl>(context) ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: _appBarTitle,
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                _searchPressed(myProvider);
              },
              child: _searchIcon,
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: RefreshIndicator(
        onRefresh: () async {
          i = 0;
          userList.clear();
          await getDataUser(0, "");
        },
        key: refreshKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                child: ListView.builder(
                  controller: myScroll,
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                     var item = userList[index];
                    return Dismissible(
                      key: Key(item.use_id.toString()),
                      direction: DismissDirection.startToEnd,
                      child: SingleUser(
                        use_index: index,
                        users: userList[index],
                      ),
                      onDismissed: (direction) {
                        userList.remove(item);
                        deleteData(
                            "use_id", item.use_id.toString(), "users/delete_user.php");
                        myProvider.add_loading();
                      },
                    );
                  },
                ),
              ),
              Positioned(
                  child: loadingList ? circularProgress() : Text(""),
                  bottom: 0,
                  left: MediaQuery.of(context).size.width / 2)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddUsers()));
                },
                child: Text(
                  "اضافة مستخدم جديد",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              height: 40.0,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(40)),
            ),
          ],
        ),
      ),
    );
  }
}


