import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showAlertDialogLoading(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Lottie.asset(
      'assets/animations/loading.json',
      width: 200,
      height: 200,
      fit: BoxFit.fill,
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
