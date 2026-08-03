
import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class AddMarkerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddMarkerState();
  }
}

class _AddMarkerState extends State<AddMarkerWidget> {

  static final CameraPosition _cameraPosition = CameraPosition(target: LatLng(25.321684, 82.987289), zoom: 10.0);

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
          'Add a Marker',
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
            _addMarker(controller);
          },
      ),
    );
  }

  Future<void> _addMarker(MapplsMapController controller) async {

    try {
      await controller.addSymbol(SymbolOptions(geometry: LatLng(25.321684, 82.987289), iconSize: 1.0),);
    } catch (e) {
      print("Error adding symbol: $e");
    }
  }

}