 import 'package:app_agear/pages/config.dart';
import 'package:app_agear/pages/function.dart';
import 'package:app_agear/pages/provider/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
  import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

 import '../../food/edit.dart';

SharedPreferences pref;
String G_foo_id_val = "";
final String G_foo_id="foo_id";
final String D_cat_id="cat_id";
final String G_foo_name="foo_name";
final String G_foo_name_en="foo_name_en";
final String G_foo_price="foo_price";
final String G_foo_offer="foo_offer";
final String G_foo_info="foo_info";
final String G_foo_info_en="foo_info_en";
final String G_foo_regdate="foo_regdate";
final String G_foo_thumbnail="foo_thumbnail";
List<FoodData> foodList = null;
String imageFood = path_images + "food/";

class FoodData {

  int foo_id;
  int cat_id;
  String foo_name;
  String foo_name_en;
  int foo_price;
  int foo_offer;
  String foo_info;
  String foo_info_en;
  String foo_regdate;
  String foo_thumbnail;

  FoodData(
      {this.foo_id,
      this.cat_id,
      this.foo_name,
      this.foo_name_en,
      this.foo_price,
      this.foo_offer,
      this.foo_info,
      this.foo_info_en,
      this.foo_regdate,
      this.foo_thumbnail});
}

class SingleFood extends StatelessWidget {
  int foo_index;
  FoodData food;
  SingleFood({this.foo_index, this.food});
  @override
  Widget build(BuildContext context) {
    var providerFood = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              foodList.removeAt(foo_index);
              deleteData("foo_id", food.foo_id.toString(), "food/delete_food.php");
              providerFood.add_loading();
            },
            child: Container(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.cancel,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: food.foo_thumbnail == null || food.foo_thumbnail == ""
                  ? CachedNetworkImage(
                      imageUrl: imageFood + "def.png",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : CachedNetworkImage(
                      imageUrl: imageFood + food.foo_thumbnail,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
              title: Text(
                food.foo_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(food.foo_regdate)]),
              trailing: Container(
                width: 30.0,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new EditFood(
                                    foo_index: foo_index, myfood: food)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: FaIcon(
                          FontAwesomeIcons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
