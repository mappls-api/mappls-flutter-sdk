import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class CameraFeatureWidget extends StatefulWidget {
  const CameraFeatureWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CameraFeatureState();
  }
}

class _CameraFeatureState extends State<CameraFeatureWidget> {
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(28.567924, 77.238542),
    zoom: 14.0,
  );

  MapplsMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // remove shadow to show separator
        backgroundColor: MapplsColor.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFC6D0F7)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Camera Feature',
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
        onMapCreated: (controller) => {mapController = controller},
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: MapplsColor.secondaryColor),
        padding: EdgeInsetsGeometry.directional(start: 8.0, end: 8.0, top: 8.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: MapplsColor.brandColor),
                backgroundColor: Colors.transparent
              ),
              onPressed: () {
                mapController?.moveCamera(CameraUpdate.newLatLngZoom(LatLng(28.567924, 77.238542), 14.0));
              },
              label: Text(
                "Move",
                style: TextStyle(color: MapplsColor.brandColor),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: MapplsColor.brandColor),
                backgroundColor: Colors.transparent
              ),
              onPressed: () {
                mapController?.easeCamera(CameraUpdate.newLatLngZoom(LatLng(28.554003, 77.259675), 12.0));
              },
              label: Text(
                "Ease",
                style: TextStyle(color: MapplsColor.brandColor),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: MapplsColor.brandColor),
                backgroundColor: Colors.transparent
              ),
              onPressed: () {
                mapController?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(28.5380727, 77.1860471), 16.0));
              },
              label: Text(
                "Animate",
                style: TextStyle(color: MapplsColor.brandColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
