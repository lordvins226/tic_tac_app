import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleProvider with ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final usersRef = FirebaseFirestore.instance.collection('users');
  bool? isAuth;

  createUserInFirestore(BuildContext context) async {
    final GoogleSignInAccount user = googleSignIn.currentUser!;
    final DocumentSnapshot doc = await usersRef.doc(user.id).get();

    if (!doc.exists) {
      usersRef.doc(user.id).set({
        "id": user.id,
        "username": user.displayName,
        "photoUrl": user.photoUrl,
        "email": user.email,
        "displayName": user.displayName,
      });
    }
  }

  handleSignIn(GoogleSignInAccount account, BuildContext context) async {
    if (account != null) {
      createUserInFirestore(context);
      print('Utilisateur Connecte avec Succes: $account');
      isAuth = true;
    } else {
      isAuth = false;
    }
  }

  login() async {
    try {
      await googleSignIn.signIn();
    } catch (e) {
      print(e);
    }
  }

  logout() async {
    try {
      await googleSignIn.signOut();
      print("Déconnecté");
    } catch (e) {
      print(e);
    }
  }
}
