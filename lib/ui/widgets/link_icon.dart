import 'package:flutter/material.dart';

class LinkIcon extends StatelessWidget {
  final String imageSrc;
  final double width;
  final double height;
  final Function onTap;

  LinkIcon({    
    this.imageSrc,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Image.asset(
        this.imageSrc,
        width: this.width,
        height: this.height,
      ),
    );
  }
}
