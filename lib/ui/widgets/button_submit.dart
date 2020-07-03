import 'package:flutter/material.dart';

class ButtonSubmit extends StatefulWidget {
  final String title;
  final Function onPressed;
  final bool busy;
  final bool enabled;

  const ButtonSubmit(
      {@required this.title,
      @required this.onPressed,
      this.busy,
      this.enabled});

  @override
  _ButtonSubmitState createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
            )),
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
