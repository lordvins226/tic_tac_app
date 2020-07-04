import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleTicTac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'TIC',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Color(0xFFf7418c),
          ),
          children: [
            TextSpan(
              text: 'TAC',
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
          ]),
    );
  }
}
