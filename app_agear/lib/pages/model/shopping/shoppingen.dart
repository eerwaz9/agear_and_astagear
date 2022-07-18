
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:app_agear/pages/account/myprofile.dart';
import 'package:app_agear/pages/function.dart';
import 'package:app_agear/pages/home/home.dart';
import 'package:app_agear/pages/provider/cart.dart';
import 'package:app_agear/pages/provider/item.dart';


class Shoppingen extends StatefulWidget {
  @override
  _ShoppingenState createState() => _ShoppingenState();
}

class _ShoppingenState extends State<Shoppingen> {


  Widget headerBuild() {



    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          //==========================back
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[100],
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })),
          Expanded(child: Text("")),
//=======================shopping cart
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: ListView.builder(
                itemCount: myProvider.listItems().length,
                itemBuilder: (context, index) {
                  return SingleProduct(

                  );
                },
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 210.0,
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


