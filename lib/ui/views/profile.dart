import 'package:flutter/material.dart';
import 'package:tic_tac_app/utils/responsive_builder.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return SafeArea(
        child: Scaffold(
            body: Center(
          child: Container(
            child: Text("Profile"),
          ),
        )),
      );
    });
  }
}
