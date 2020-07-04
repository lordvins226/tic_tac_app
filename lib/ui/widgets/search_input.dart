import 'package:flutter/material.dart';
import 'package:tic_tac_app/utils/app_color.dart';

class SearchInput extends StatefulWidget {
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_statements
    myController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: myController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 16),
          filled: true,
          fillColor: AppColor.backgroundColor[2],
          border: InputBorder.none,
          hintText: 'Réchercher un Plat a prix Reduit',
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.textColor[300],
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 8),
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Image.asset(
              'assets/icons/search.png',
              height: 10,
              width: 16,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
