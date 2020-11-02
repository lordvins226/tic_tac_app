import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_app/ui/views/FoodOrderPage.dart';
import 'package:tic_tac_app/ui/views/login.dart';
import 'package:tic_tac_app/ui/views/profile.dart';
import 'package:tic_tac_app/ui/views/register.dart';
import 'package:tic_tac_app/ui/views/welcome.dart';
import 'package:tic_tac_app/ui/widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/Home": (_) => MyHomePage(),
        "/Login": (_) => LoginPage(),
        "/Register": (_) => RegisterPage(),
        "/Profile": (_) => ProfilePage(),
        "/Cart": (_) => FoodOrderPage()
      },
      home: MyHomePage(),
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigation();
  }
}
