import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/pages/account/login.dart';

import 'package:restaurant/pages/provider/cart.dart';
import 'package:restaurant/pages/provider/loading.dart';
import 'package:restaurant/pages/tips/getStart.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:restaurant/pages/config.dart';

import 'pages/config.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  G_cus_id_val = prefs.getInt(G_cus_id).toString();
  runApp(Splash());
}

//343434
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoadingControl>(
            create: (context) => LoadingControl(),
          ),
          ChangeNotifierProvider<Cart>(
            create: (context) => Cart(),
          )
        ],
        child: MaterialApp(
            theme: ThemeData(fontFamily: 'GE_ar'),
            debugShowCheckedModeBanner: false,
            home: new SplashScreen(
              seconds: 3,
              routeName: "/",
              navigateAfterSeconds:
                  G_cus_id_val == null ? new Login() : new  GetStart(),
              title: new Text(
                'Welcome to APPA application',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              /*image: new Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png'),*/
              backgroundColor: primaryColor,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              onClick: () => print("restaurant"),
              loaderColor: Colors.tealAccent,
            )));
  }
}
