
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class MapLongClickEvent extends StatefulWidget {
  const MapLongClickEvent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapLongClickEventState();
  }

}

class _MapLongClickEventState extends State {

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(28.551087, 77.257373),
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context
      ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Map Long Click'),
      ),
      body: MapplsMap(
        initialCameraPosition: _kInitialPosition,
        onMapLongClick: (point, latLng) => {
          Fluttertoast.showToast(msg: latLng.toString())
        },
      ),
    );
  }
}