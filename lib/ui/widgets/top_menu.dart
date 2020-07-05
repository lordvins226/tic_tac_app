import 'package:flutter/material.dart';
import 'package:tic_tac_app/utils/app_color.dart';

class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TopMenuTiles(name: "Mafé", imageUrl: "mafe", slug: ""),
          TopMenuTiles(name: "Fufu", imageUrl: "fufu", slug: ""),
          TopMenuTiles(name: "Gombo", imageUrl: "gombo", slug: ""),
          TopMenuTiles(name: "Gonré", imageUrl: "gonre", slug: ""),
          TopMenuTiles(name: "Alloco", imageUrl: "alloco", slug: ""),
          TopMenuTiles(name: "Attiéké", imageUrl: "attieke", slug: ""),
          TopMenuTiles(name: "Babenda", imageUrl: "babenda", slug: ""),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;

  TopMenuTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 25.0,
                offset: Offset(0.0, 0.75),
              ),
            ]),
            child: Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: Container(
                  width: 55,
                  height: 55,
                  child: Center(
                      child: Image.asset(
                    'assets/images/topmenu/' + imageUrl + ".jpg",
                    width: 50,
                    height: 50,
                  )),
                )),
          ),
          Text(name,
              style: TextStyle(
                  color: AppColor.textColor[500],
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
