import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_app/service_locator.dart';
import 'package:tic_tac_app/ui/views/FoodOrderPage.dart';
import 'package:tic_tac_app/ui/views/login.dart';
import 'package:tic_tac_app/ui/views/profile.dart';
import 'package:tic_tac_app/ui/views/register.dart';
import 'package:tic_tac_app/ui/views/welcome.dart';
import 'package:tic_tac_app/ui/widgets/bottom_bar.dart';

import 'core/providers/BottomNavigationBarProvider.dart';
import 'core/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Auth(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/Home": (_) => MyHomePage(),
        "/Login": (_) => LoginPage(),
        "/Register": (_) => RegisterPage(),
        "/Profile": (_) => ProfilePage(),
        "/Cart": (_) => FoodOrderPage()
      },
      home: Consumer<Auth>(
        builder: (context, notifier, child) {
          return notifier.user != null ? MyHomePage() : WelcomePage();
        },
      ),
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<BottomNavigationBarProvider>(
        child: BottomNavigation(),
        create: (BuildContext context) => BottomNavigationBarProvider(),
      ),
    );
  }
}
