

import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class MapplsPinCameraFeature  extends StatefulWidget{
  const MapplsPinCameraFeature({super.key});

  @override
  State<MapplsPinCameraFeature> createState() => _MapplsPinCameraFeatureState();

}

class _MapplsPinCameraFeatureState  extends State<MapplsPinCameraFeature>{

  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(28.613426, 77.231774),
    zoom: 16.0,
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
          'Mappls Pin Camera Feature',
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
                mapController?.moveCameraWithMapplsPin(CameraMapplsPinUpdate.newMapplsPinZoom("utga9e", 16.0));
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
                mapController?.easeCameraWithMapplsPin(CameraMapplsPinUpdate.newMapplsPinZoom("12af19", 16.0));
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
                mapController?.animateCameraWithMapplsPin(CameraMapplsPinUpdate.newMapplsPinZoom("3lgk1a", 16.0));
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