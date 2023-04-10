import 'package:flutter/material.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CurrentLocationState();
  }
}

class _CurrentLocationState extends State {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 14.0,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.colorPrimary,
          title: const Text('Current Location'),
        ),
        body: MapplsMap(
          initialCameraPosition: _kInitialPosition,
          myLocationEnabled: true,
          myLocationTrackingMode: MyLocationTrackingMode.Tracking,
        ));
  }
}
