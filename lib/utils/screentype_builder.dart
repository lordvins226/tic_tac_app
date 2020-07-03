import 'package:flutter/material.dart';
import 'package:tic_tac_app/core/enums/device_screen_type.dart';
import 'package:tic_tac_app/utils/responsive_builder.dart';

class ScreenTypeBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeBuilder(
      {Key key, @required this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceType == DeviceScreenType.Tablet) {
        if (tablet != null) {
          return tablet;
        }
      }

      if (sizingInformation.deviceType == DeviceScreenType.Desktop) {
        if (desktop != null) {
          return desktop;
        }
      }
      return mobile;
    });
  }
}
