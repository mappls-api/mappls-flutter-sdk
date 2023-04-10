
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class ReverseGeocodeWidget extends StatefulWidget {
  const ReverseGeocodeWidget({super.key});


  @override
  State<StatefulWidget> createState() {
    return _ReverseGeocodeState();
  }
}

class _ReverseGeocodeState extends State {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );
  late MapplsMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Reverse Geocode'),
      ),
      body: MapplsMap(
        initialCameraPosition: _kInitialPosition,
        onMapLongClick: (point, latlng) => {reverseGeocode(latlng)},
      ),
    );
  }


  reverseGeocode(LatLng latlng) async {
    try {
      ReverseGeocodeResponse? result = await MapplsReverseGeocode(
          location: latlng).callReverseGeocode();
      if (result != null && result.results != null &&
          result.results!.isNotEmpty) {
        Fluttertoast.showToast(msg: result.results![0].formattedAddress!);
      }
      print(result);
    } catch (e) {
      if (e is PlatformException) {
        Fluttertoast.showToast(msg: '${e.code} --- ${e.message}');
      }
    }
  }
}