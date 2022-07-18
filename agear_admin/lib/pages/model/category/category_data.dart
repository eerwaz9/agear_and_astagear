import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:ageer_admin/pages/model/food/food.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ageer_admin/pages/config.dart';
  import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../function.dart';
import 'edit.dart';



SharedPreferences pref;

String G_cat_id_val = "";
final String G_cat_id = "cat_id";
final String G_cat_name = "cat_name";
final String G_cat_name_en = "cat_name_en";
 final String G_cat_thumball = "cat_thumball";
final String G_cat_image = "cat_image";

List<CategoryData> categoryList = null;
String imageCategory = path_images + "category/";

class CategoryData {
  int cat_id;
  String cat_name;
  String cat_name_en;
  String cat_regdate;
  String cat_thumball;
  String cat_image;
  CategoryData(
      {this.cat_id,
      this.cat_name,
      this.cat_name_en,
      this.cat_regdate,
      this.cat_thumball,this.cat_image
      });
}

class SingleCategory extends StatelessWidget {
  int cat_index;
  CategoryData category;
  SingleCategory({this.cat_index, this.category});
  @override
  Widget build(BuildContext context) {
    var providerCategory = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              categoryList.removeAt(cat_index);
              deleteData(
                  "cat_id", category.cat_id.toString(), "category/delete_category.php");
              providerCategory.add_loading();
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
              leading: category.cat_thumball == null ||
                      category.cat_thumball == ""
                  ? CachedNetworkImage(
                      imageUrl: imageCategory + "def.png",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : CachedNetworkImage(
                      imageUrl: imageCategory + category.cat_thumball,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
              title: Text(
                category.cat_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.cat_regdate),
                    RaisedButton(
                      child: Text("اضافة المأكولات"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new Food(
                                    cat_id: category.cat_id.toString(),
                                    cat_name: category.cat_name)));
                      },
                    )
                  ]),
              trailing: Container(
                width: 30.0,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new EditCategory(
                                    cat_index: cat_index,
                                    mycategory: category)));
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
