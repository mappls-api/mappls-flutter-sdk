

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_gl/mappls_gl.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';

class AddPolygon extends StatefulWidget {
  const AddPolygon({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddPolygoneState();
  }

}

class _AddPolygoneState extends State {


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
        title: const Text('Add Polygon'),
    ),
        body: MapplsMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: (mapController) {
              this.mapController = mapController;
            },
          onStyleLoadedCallback: () {
            addPolygon();
          },
        ));
  }


  void addPolygon() async {
    List<List<LatLng>> latlng = const [<LatLng>[
      LatLng(28.703900, 77.101318),
      LatLng(28.703331, 77.102155),
      LatLng(28.703905, 77.102761),
      LatLng(28.704248, 77.102370),
      LatLng(28.703900, 77.101318),
    ]];
    LatLngBounds latLngBounds = boundsFromLatLngList(latlng.first);
    mapController.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds));
    mapController.addFill(FillOptions(geometry: latlng, fillColor: "#3bb2d0"));

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