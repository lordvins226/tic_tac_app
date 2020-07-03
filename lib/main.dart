import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_app/service_locator.dart';
import 'package:tic_tac_app/ui/views/home.dart';
import 'package:tic_tac_app/ui/views/login.dart';
import 'package:tic_tac_app/ui/views/profile.dart';
import 'package:tic_tac_app/ui/views/register.dart';
import 'package:tic_tac_app/ui/views/welcome.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocator();
  runApp(
    MyApp(),
  );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/Home": (_) => HomePage(),
        "/Login": (_) => LoginPage(),
        "/Register": (_) => RegisterPage(),
        "/Profile": (_) => ProfilePage(),
      },
      home: WelcomePage(),
    );
  }
}

