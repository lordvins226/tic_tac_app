import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showAlertDialogSuccess(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Lottie.asset(
      'assets/animations/success.json',
      width: 200,
      height: 200,
      fit: BoxFit.fill,
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
