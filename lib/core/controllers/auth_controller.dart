import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  FirebaseUser _user;

  FirebaseUser get user => _user;

  void setUser(FirebaseUser user) {
    _user = user;
    notifyListeners();
  }
}
