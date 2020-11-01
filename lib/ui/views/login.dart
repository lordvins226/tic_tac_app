import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_app/core/providers/auth_provider.dart';
import 'package:tic_tac_app/core/providers/google_sign_in_provider.dart';
import 'package:tic_tac_app/ui/widgets/button_google.dart';
import 'package:tic_tac_app/ui/widgets/button_submit.dart';
import 'package:tic_tac_app/ui/widgets/create_account_label.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_app/ui/widgets/divider.dart';
import 'package:tic_tac_app/ui/widgets/tictac_title.dart';

import '../../service_locator.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAuth = false;
  String _email;
  String _password;
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Auth auth = Provider.of<Auth>(context, listen: false);
    //initializeCurrentUser(Auth);
    super.initState();
  }

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
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: inputTitle,
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _entryField(
            "Email",
            "Email",
            validator: (val) => !EmailValidator.validate(val, true)
                ? "L'adresse Email est Invalid"
                : null,
            onChanged: (val) => _email = val,
          ),
          _entryField(
            "Mot de Passe",
            "Mot de Passe",
            isPassword: true,
            validator: (val) => val.length < 6
                ? 'Entrez un mot de passe avec plus de 6 caractères'
                    'des caracteres'
                : null,
            onChanged: (val) => _password = val,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                  child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TitleTicTac(),
                      _emailPasswordWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      Builder(builder: (context) {
                        return ButtonSubmit(
                          title: 'Connexion',
                          onPressed: () async {},
                        );
                      }),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text('Mot de Passe Oublié ?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                      DividerWidget(),
                      ButtonGoogle(
                        onPressed: () async {
                          print("Connexion avec Google");
                          locator<GoogleProvider>().login().whenComplete(() {
                            Navigator.pushReplacementNamed(context, "/Home");
                          });
                          locator<GoogleProvider>()
                              .createUserInFirestore(context);
                        },
                      ),
                      CreateAccountLabel()
                    ],
                  ),
                ),
              )));
        },
      )),
    );
  }
}
