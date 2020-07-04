import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_app/ui/animations/loading.dart';
import 'package:tic_tac_app/ui/animations/success.dart';
import 'package:tic_tac_app/ui/widgets/button_submit.dart';
import 'package:tic_tac_app/ui/widgets/login_account_label.dart';
import 'package:tic_tac_app/ui/widgets/tictac_title.dart';
import 'package:tic_tac_app/utils/responsive_builder.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser currentUser;

  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String error = '';

  final _formKey = GlobalKey<FormState>();

  Widget _entryField(String title, String inputTitle,
      {bool isPassword = false,
      FormFieldValidator validator,
      ValueChanged onChanged}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
              validator: validator,
              onChanged: onChanged,
              obscureText: isPassword,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: inputTitle,
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _signUpFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _entryField(
            "Nom d'utilisateur",
            "Nom d'utilisateur",
            validator: (val) => val.isEmpty ? 'Entrer le Nom' : null,
            onChanged: (val) => username = val,
          ),
          _entryField(
            "Email",
            "Email",
            validator: (val) => !EmailValidator.validate(val, true)
                ? "L'adresse Email est Invalid"
                : null,
            onChanged: (val) => email = val,
          ),
          _entryField(
            "Mot de Passe",
            "Mot de Passe",
            validator: (val) => val.length < 6
                ? 'Entrez un mot de passe avec plus de 6 caractères'
                    'des caracteres'
                : null,
            onChanged: (val) => password = val,
            isPassword: true,
          ),
          _entryField("Confirmer Mot de Passe", "Confirmer le Mot de Passe",
              onChanged: (val) => confirmPassword = val,
              validator: (val) => confirmPassword != password
                  ? 'Le Mot de passe ne correspond pas'
                  : null,
              isPassword: true),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                    height: sizingInformation.screenSize.height,
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: <Widget>[
                                  TitleTicTac(),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  _signUpFormWidget(),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Builder(
                                    builder: (context) {
                                      return ButtonSubmit(
                                        title: "S'inscrire",
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                            AuthResult result = await _auth
                                                .createUserWithEmailAndPassword(
                                                    email: email,
                                                    password: password);
                                            FirebaseUser user = result.user;
                                            await userCollection
                                                .document(user.uid)
                                                .setData({
                                              'Email': email,
                                              'Username': username
                                            });

                                            if (result == null) {
                                              setState(() {
                                                error =
                                                    'Veuillez Entrer un Email Valid';
                                              });
                                            } else {
                                              showAlertDialogSuccess(context);
                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                        "Compte Créer avec Succès",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      duration: Duration(
                                                          seconds: 3)));
//                                              Navigator.push(
//                                                  context,
//                                                  MaterialPageRoute(
//                                                      builder: (context) =>
//                                                          LoginPage()));
                                            }
                                          } else {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                      "Impossible de Creer Un Compte",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    duration:
                                                        Duration(seconds: 3)));
                                          }
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  LoginAccountLabel(),
                                ],
                              ),
                            ),
                          ],
                        ))));
          },
        ));
      },
    ));
  }
}
