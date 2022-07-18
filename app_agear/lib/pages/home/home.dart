import 'package:app_agear/pages/account/myprofile.dart';
import 'package:app_agear/pages/drawer/mydrawer.dart';
import 'package:app_agear/pages/model/product/product.dart';
import 'package:app_agear/pages/model/product/productData.dart';
import 'package:app_agear/pages/model/product/product_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:app_agear/pages/provider/loading.dart';
import '../config.dart';
import '../function.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();
  bool loadingCategory = false;

  var myarr_category = [];

  getCategoryData() async {
    loadingCategory = true;
    setState(() {});

    List arr = await getData(0, 100, "category/readcategory.php", "", "");
    for (int i = 0; i < arr.length; i++) {
      myarr_category.add({
        "cat_id": arr[i]["cat_id"],
        "cat_name": arr[i]["cat_name"],
        "cat_image": arr[i]["cat_thumbnail"] == null
            ? "def.png"
            : arr[i]["cat_thumbnail"]
      });
    }



    print(arr);
    print(arr);
    print(arr);
    print(arr.length);
    print(arr.length);
    print(arr.length);
    loadingCategory = false;
    setState(() {});
  }

//=====================================food
//   List<FoodData> foodList = [];
//   Future<List<FoodData>> getRequest(int start, int end, String urlPage, String strSearch, String param) async {
//String url = path_api +
//       "${urlPage}?${param}txtsearch=${strSearch}&start=${start}&end=${end}&token=" +token;
//
//     final response =await http.get(url, headers: {'Authorization': 'token $token'});
//     List responseData = json.decode(utf8.decode(response.bodyBytes));
//     if (response.statusCode == 200) {
//       print("responseData");
//       print(responseData);
//       for (int i = 0; i < responseData.length; i++) {
//         FoodData food = FoodData(
//   foo_id: arr[i]["foo_id"],
//   cat_id: arr[i]["cat_id"],
//   foo_name: arr[i]["foo_name"],
//   foo_name_en: arr[i]["foo_name_en"],
//   foo_price: arr[i]["foo_price"],
//   foo_offer: arr[i]["foo_offer"],
//   foo_info: arr[i]["foo_info"],
//   foo_info_en: arr[i]["foo_info_en"],
//   fav_id: arr[i]["fav_id"],
//   foo_regdate: arr[i]["foo_regdate"],
//   foo_thumbnail: arr[i]["foo_thumbnail"],
//   foo_image: arr[i]["foo_image"],
//         );
//         print(foodList.length);
//         requests.add(food);
//       }
//       setState(() {
//         foodList = foodList;
//       });
//     }
//     return foodList;
//   }

  List<FoodData> foodList =null;
  ScrollController myScroll;
  GlobalKey<RefreshIndicatorState> refreshKey;
  int i = 0;
  bool loadingList = false;
  void getDataFood(int count, String strSearch) async {
    loadingList = true;
    setState(() {});
    //عالجة خطاء هنا
    // int i=0;
    List arry = await getData(count, 20, "food/readfoodcustomer.php", strSearch,
        "foo_offer=1&cus_id=${G_cus_id_val.length}&");
    // اصلحت هنا غلط بوضع length.toInt
print(arry.length);
    for ( int i = 0; i < arry.length; i++) {
      foodList.add(new FoodData(
        foo_id: arry[i]["foo_id"].toString(),
        cat_id: arry[i]["cat_id"].toString(),
        foo_name: arry[i]["foo_name"],
        foo_name_en: arry[i]["foo_name_en"],
        foo_price: arry[i]["foo_price"].toString(),
        foo_offer: arry[i]["foo_offer"].toString(),
        foo_info: arry[i]["foo_info"],
        foo_info_en: arry[i]["foo_info_en"],
        fav_id: arry[i]["fav_id"],
        foo_regdate: arry[i]["foo_regdate"],
        foo_image: arry[i]["foo_thumbnail"]== null? "def.png"
            : arry[i]["foo_thumbnail"],

      ),
      );
    }
    print(arry);
    print(arry);
    print(arry);
    print(arry.length);
    print(arry.length);
    print(arry.length);
    loadingList = false;

    // return foodList
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myScroll.dispose();
    foodList.clear();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryData();
    foodList = new List<FoodData>();
    myScroll = new ScrollController();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    getDataFood(0, "");

    myScroll.addListener(() {
      if (myScroll.position.pixels == myScroll.position.maxScrollExtent) {
        i += 20;
        getDataFood(i, "");
        print("scroll");
      }
    });
  }

//=====================================food
  @override
  Widget build(BuildContext context) {
    var myProv = Provider.of<LoadingControl>(context);
    return Container(
      color: Colors.grey[400],
      child: Scaffold(

        key: _keyDrawer,
        endDrawer: MyDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(top: 35.0),
                  padding: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                        image: AssetImage("images/product/pro3.jpg")

                    )

                  ),
                  child: Text(
                    "توصيل الطلب الى",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),

                  )),

  Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        "موقع الزبون",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      )),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {}),
                ],
              ),
              new Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _keyDrawer.currentState.openEndDrawer();
                      },
                      child: new Icon(
                        Icons.menu,
                        color: Colors.blueGrey,
                        size: 40.0,
                      ),
                    ),
                    Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: new TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "بحث",
                              suffixIcon: Icon(Icons.search)),
                          onChanged: (text) {
                            print(text);

                            foodList.clear();
                            i = 0;
                            getDataFood(0, text);
                            myProv.add_loading();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                width: MediaQuery.of(context).size.width,
                height: 110.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myarr_category.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleCategory(
                          cat_id: myarr_category[index]["cat_id"].toString(),
                          cat_image: myarr_category[index]["cat_image"],
                          cat_name: myarr_category[index]["cat_name"]);
                    }),
              ),
              Expanded(
                child: new Container(
                  child: ListView.builder(
                      itemCount: foodList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleProduct(
                          foo_index: index,
                          food: foodList[index],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(


            currentIndex: 0,
            selectedItemColor: Colors.blueGrey,
            selectedFontSize: 15,
            unselectedItemColor: Colors.green,
            unselectedFontSize: 14,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(


                icon: Icon(

                  Icons.notifications,

                  size: 40.0,
                ),
                title: new Text("الاشعارات"),
              ),
              BottomNavigationBarItem(

                icon: Icon(

                  Icons.accessibility,color: Colors.blueGrey,
                  size: 40.0,
                ),
                title: new Text("العروض"),
              ),
              BottomNavigationBarItem(

                icon: Icon(

                  Icons.camera_alt_outlined,color: Colors.blueGrey,
                  size: 40.0,
                ),
                title: new Text("الكاميره"),
              ),
              BottomNavigationBarItem(

                icon:IconButton(
                  onPressed:  () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => new MyProfile()));
              },
                  icon: Icon(Icons.person,size: 40,),color: Colors.blueGrey,

                ),

                title: new Text("حسابي"),
              ),
            ]),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  int foo_index;
  FoodData food;
  SingleProduct({this.foo_index, this.food});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      food: food,
                    )));
      },
      child: new Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: CachedNetworkImage(
                imageUrl: imagesFood +
                    (food.foo_thumbnail == null || food.foo_thumbnail == ""
                        ? "def.png"
                        : food.foo_thumbnail),
                imageBuilder: (context, imageProvider) => Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            new Text(
              food.foo_name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            new Text(
              food.foo_info,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleCategory extends StatelessWidget {
  final String cat_id;
  final String cat_name;
  final String cat_image;

  SingleCategory({this.cat_id, this.cat_name, this.cat_image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new Product(
                      cat_id: cat_id,
                      cat_name: cat_name,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blue[100]),
              child: cat_image == null || cat_image == ""
                  ? CachedNetworkImage(
                      height: 64.0,
                      width: 64.0,
                      fit: BoxFit.cover,
                      imageUrl: images_Category + "def.png",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : CachedNetworkImage(
                      height: 64.0,
                      width: 64.0,
                      fit: BoxFit.cover,
                      imageUrl: images_Category + cat_image,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
            ),
            Text(
              cat_name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

    );

  }
}

