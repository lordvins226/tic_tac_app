import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        qrCode = "Appuyez sur Retour avant de Scanner";
      });
    } catch (ex) {
      setState(() {
        qrCode = "Erreur inconnu $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Text(
              qrCode,
              style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFFf7418c),
          icon: Icon(Icons.camera_alt),
          label: Text("Scanner"),
          onPressed: () {
            scanQR;
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
