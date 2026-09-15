
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class AddCustomMarkerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCustomMarkerState();
  }
}

class _AddCustomMarkerState extends State<AddCustomMarkerWidget> {

  static final CameraPosition _cameraPosition = CameraPosition(target: LatLng(25.321684, 82.987289), zoom: 10.0);
  MapplsMapController? _mapController = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        // remove shadow to show separator
        backgroundColor: MapplsColor.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFC6D0F7)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add Custom Marker',
          style: TextStyle(color: MapplsColor.primaryTextColor, fontSize: 20.0),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // height of the line
          child: Container(
            color: Color(0x723C445B), // color of the line
            height: 1.0,
          ),
        ),
      ),
      body: MapplsMap(
        initialCameraPosition: _cameraPosition,
        onMapCreated: (MapplsMapController controller) {
          this._mapController = controller;

        },
        onStyleLoadedCallback: () {
          _addMarker();
        },
      ),
    );
  }

  Future<void> addImageFromAsset( String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return _mapController?.addImage(name, list);
  }

  Future<void> _addMarker() async {

    try {
      await addImageFromAsset("icon", "assets/custom_marker.png");
      await _mapController?.addSymbol(SymbolOptions(geometry: LatLng(25.321684, 82.987289), iconImage: "icon", iconSize: 2.0),);
    } catch (e) {
      print("Error adding symbol: $e");
    }
  }

}