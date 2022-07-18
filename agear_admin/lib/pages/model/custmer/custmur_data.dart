import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
 import 'package:ageer_admin/pages/config.dart';
 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../function.dart';
import 'edit.dart';
SharedPreferences sherd;
String G_cus_id_val = "";
final String G_cus_id="cus_id";
final String G_cus_name="cus_name";
final String G_cus_pwd="cus_pwd";
final String G_cus_mobile="cus_mobile";
final String G_cus_email="cus_email";
final String G_cus_regdate="cus_regdate";
final String G_cus_thumbnail="cus_thumbnail";
// final Stringcus_id G_cus_regdate="foo_regdate";
// final String G_cus_thumbnail="foo_thumbnail";
List<CustomerData> CustomerList = null;
String imagecustomer = path_images + "customer/";
class CustomerData {
  int cus_id;
  String cus_name;
  String cus_pwd;
  String cus_mobile;
  String cus_email;
  String cus_regdate;
  String cus_thumbnail;
  double cus_latiute;
  double cus_latuite;
  CustomerData(
      {this.cus_id,
      this.cus_name,
      this.cus_pwd,
      this.cus_mobile,
      this.cus_email,
      this.cus_regdate,
      this.cus_thumbnail
      ,this.cus_latiute,
      this.cus_latuite});
}

class SingleCustomer extends StatelessWidget {
  int cus_index;
  CustomerData customer;
  SingleCustomer({this.cus_index, this.customer});
  @override
  Widget build(BuildContext context) {
    var providerDelivery = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              CustomerList.removeAt(cus_index);
              deleteData(
                  "cus_id", customer.cus_id.toString(), "customer/delete_customer.php");
              providerDelivery.add_loading();
            },
            child: Container(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: customer.cus_thumbnail == null ||
                  customer.cus_thumbnail == ""
                  ? CachedNetworkImage(
                      imageUrl: imagecustomer + "def.png",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : CachedNetworkImage(
                      imageUrl: imagecustomer + customer.cus_thumbnail,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
              title: Text(
                customer.cus_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(customer.cus_regdate.toString())]),
              trailing: Container(
                width: 30.0,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new EditCustomer(
                                    cus_index: cus_index,
                                    mycustomer: customer)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: FaIcon(
                          FontAwesomeIcons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
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
