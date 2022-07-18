import 'package:ageer_admin/pages/core/account/login.dart';
import 'package:ageer_admin/pages/core/provider/loading.dart';
import 'package:ageer_admin/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ageer_admin/pages/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  G_use_id_val = prefs.getString(G_use_id);
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
          )
        ],
        child: MaterialApp(
            theme: ThemeData(fontFamily: 'GE_ar'),
            debugShowCheckedModeBanner: false,
            home: new Container(
                child: SplashScreen(
              image: new Image.asset(
                'images/category/agear2.png',
              ),
              loadingText: Text(
                "",
                style: TextStyle(fontSize: 50),
              ),
              seconds: 5,
              routeName: "/",
              navigateAfterSeconds:
                  G_use_id_val == null ? new Login() : new Home(),
              title: new Text(
                'مرحبا بكم في تطبيق إدارة الايجارات الإيجارات',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
              backgroundColor: primaryColor,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 120.0,
              onClick: () => print("Agear"),
              loaderColor: Colors.red,
            ))));
  }
}
