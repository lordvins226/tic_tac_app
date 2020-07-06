import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String qrCode = "";

  Future scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        qrCode = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          qrCode = "Permission Caméra Réfusée";
        });
      } else {
        setState(() {
          qrCode = "Erreur inconnu $ex";
        });
      }
    } on FormatException {
      setState(() {
        qrCode = "Appuyez sur Retour avant a"
            "de Scanner";
      });
    } catch (ex) {
      setState(() {
        qrCode = "Erreur inconnu $ex";
      });
    }
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Text(
        qrCode,
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
          onPressed: scanQR,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
