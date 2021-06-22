import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Text(
        "qrCode",
        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(child: showAlertDialog(context)),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFFf7418c),
          icon: Icon(Icons.camera_alt),
          label: Text("Scanner"),
          onPressed: null,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
