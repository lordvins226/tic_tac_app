import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tic_tac_app/utils/responsive_builder.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  static LatLng _lastMapPosition = _initialPosition;

  void _getUserLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemark = await Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude);
      setState(() {
        _initialPosition = LatLng(position.latitude, position.longitude);
        print('${placemark[0].name}');
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _initialPosition;
    _getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            GoogleMap(
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 12,
              ),
            )
          ],
        )),
      );
    });
  }
}
