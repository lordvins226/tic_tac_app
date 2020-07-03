import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          print("Commencer");
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 13,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              "Commencer",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
