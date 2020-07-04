import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tic_tac_app/ui/widgets/link_icon.dart';
import 'package:tic_tac_app/ui/widgets/search_input.dart';
import 'package:tic_tac_app/ui/widgets/tictac_title.dart';
import 'package:tic_tac_app/utils/app_color.dart';
import 'package:tic_tac_app/utils/responsive_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              brightness: Brightness.light,
              actions: [
                GestureDetector(
                  child: Icon(FontAwesomeIcons.shoppingBag),
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildHeader(context),
                    _buildSubHeader(context),
                    SearchInput(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

_buildSubHeader(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 8,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(margin: EdgeInsets.only(bottom: 16), child: TitleTicTac()),
        Text(
          "L'application qui lutte contre le Gaspillage Alimentaire",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.textColor[500],
          ),
        ),
      ],
    ),
  );
}

_buildHeader(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 24,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LinkIcon(
          imageSrc: 'assets/icons/menu.png',
          height: 10,
          width: 16,
          onTap: () {},
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, "/Profile");
            },
            child: Icon(FontAwesomeIcons.shoppingBag)),
      ],
    ),
  );
}
