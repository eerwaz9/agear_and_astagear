import 'dart:ui';

import 'package:ageer_admin/pages/core/component/progress.dart';
import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:ageer_admin/pages/config.dart';
import 'package:ageer_admin/pages/function.dart';
import 'package:provider/provider.dart';
import 'add.dart';
import 'custmur_data.dart';
// CustomerList
class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}
class _CustomerState extends State<Customer> {
  ScrollController myScroll;
  GlobalKey<RefreshIndicatorState> refreshKey;
  int i = 0;
  bool loadingList = false;
  void getDataCustmur(int count, String strSearch) async {
    loadingList = true;
    setState(() {});
    List arr = await getData(count, "customer/readcustomer.php", strSearch, "");
    for (int i = 0; i < arr.length.toInt(); i++) {
      CustomerList.add(new CustomerData(
        cus_id: arr[i]["cus_id"],
        cus_name: arr[i]["cus_name"],
        cus_pwd: arr[i]["cus_pwd"],
        cus_mobile: arr[i]["cus_mobile"],
        cus_email: arr[i]["cus_email"],
        cus_regdate: arr[i]["cus_regdate"],
        cus_thumbnail: arr[i]["cus_thumbnail"],
      ));
    }
    loadingList = false;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myScroll.dispose();
    CustomerList.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appBarTitle = new Text("استعراض الزبائن");
    CustomerList = new List<CustomerData>();
    myScroll = new ScrollController();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    getDataCustmur(0, "");

    myScroll.addListener(() {
      if (myScroll.position.pixels == myScroll.position.maxScrollExtent) {
        i += 10;
        getDataCustmur(i, "");
        print("scroll");
      }
    });
  }

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle;

  void _searchPressed(LoadingControl myProv) {
    if (this._searchIcon.icon == Icons.search) {
      this._searchIcon = new Icon(Icons.close);
      this._appBarTitle = new TextField(
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            prefixIcon: Icon(Icons.search), hintText: "ابحث ..."),
        onChanged: (text) {
          print(text);

          CustomerList.clear();
          i = 0;
          getDataCustmur(0, text);
          myProv.add_loading();
        },
      );
    } else {
      this._searchIcon = new Icon(Icons.search);
      this._appBarTitle = new Text("بحث باسم الزبون");
    }
    myProv.add_loading();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<LoadingControl>(context);
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
          CustomerList.clear();
          await getDataCustmur(0, "");
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
                  itemCount: CustomerList.length,
                  itemBuilder: (context, index) {
                    final item =CustomerList[index];
                    return Dismissible(
                      key: Key(item.cus_id.toString()),
                      direction: DismissDirection.startToEnd,
                      child: SingleCustomer(
                        cus_index: index,
                        customer: CustomerList[index],
                      ),
                      onDismissed: (direction) {
                        CustomerList.remove(item);
                        deleteData("cus_id", item.cus_id.toString(),
                            "customer/delete_customer.php");
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
                      MaterialPageRoute(builder: (context) => AddCustmur()));
                },
                child: Text(
                  "اضافة زبون",
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
