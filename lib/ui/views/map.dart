import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  static LatLng _lastMapPosition = _initialPosition;
  MapType _currentMapType = MapType.normal;

  Future _getUserLocation() async {
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
    _getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _initialPosition == null
              ? Container()
              : GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapType: _currentMapType,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 12,
                  ),
                )),
    );
  }
}
