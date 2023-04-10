

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_gl/mappls_gl.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';

class AddPolyline extends StatefulWidget {
  const AddPolyline({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddPolylineState();
  }

}

class _AddPolylineState extends State {


  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(28.705436, 77.100462),
    zoom: 14.0,
  );

  late MapplsMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Add Polyline'),
    ),
        body: MapplsMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: (mapController) {
              this.mapController = mapController;
            },
          onStyleLoadedCallback: () {
            addPolyline();
          },
        ));
  }


  void addPolyline() async {
    List<LatLng> latlng = const <LatLng>[
      LatLng(28.705436, 77.100462),
      LatLng(28.705191, 77.100784),
      LatLng(28.704646, 77.101514),
      LatLng(28.704194, 77.101171),
      LatLng(28.704083, 77.101066),
      LatLng(28.703900, 77.101318)
    ];
    LatLngBounds latLngBounds = boundsFromLatLngList(latlng);
    mapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds));
    mapController.addLine(LineOptions(geometry: latlng, lineColor: "#3bb2d0", lineWidth: 4));

  }

  boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null || x1 == null || y0 == null || y1 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }
}