import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:tic_tac_app/ui/widgets/button_submit.dart';
import 'package:tic_tac_app/ui/widgets/getstarted.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LiquidSwipe(
          pages: pages,
          fullTransitionValue: 500,
          enableSlideIcon: true,
          enableLoop: false,
        ),
      ),
    );
  }
}

final pages = [
  Container(
    color: Colors.pink,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          'assets/images/bestfood/ic_best_food_1.jpeg',
          fit: BoxFit.cover,
        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            new Text(
              "Bienvenue",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "Sur TicTac",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  ),
  Container(
    color: Color(0xFFfbab66),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          'assets/images/bestfood/ic_best_food_2.jpeg',
          fit: BoxFit.cover,
        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            new Text(
              "Ne Jetez",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "Pas La Nourriture",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  ),
  Container(
    color: Colors.deepPurpleAccent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          'assets/images/bestfood/ic_best_food_3.jpeg',
          fit: BoxFit.cover,
        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            new Text(
              "Luttons Contre",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              " le Gaspillage ",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "Alimentaire",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  ),
  Container(
    color: Colors.greenAccent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          'assets/images/bestfood/ic_best_food_4.jpeg',
          fit: BoxFit.cover,
        ),
        Padding(padding: const EdgeInsets.all(20.0)),
        Column(
          children: <Widget>[
            new Text(
              "Soyons",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            new Text(
              "Ecolo!",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Billy",
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Container(width: 250,
                child: GetStarted())
          ],
        )
      ],
    ),
  ),
];
