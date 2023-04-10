

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_gl/mappls_gl.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';

class MarkerDragging extends StatefulWidget {
  const MarkerDragging({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MarkerDraggingState();
  }

}

class _MarkerDraggingState extends State {


  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 14.0,
  );

  late MapplsMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Marker Dragging'),
    ),
        body: MapplsMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: (mapController) {
              this.mapController = mapController;
            },
          annotationOrder: const [
            AnnotationType.fill,
            AnnotationType.circle,
            AnnotationType.line,
            AnnotationType.symbol,
          ],
          onStyleLoadedCallback: () {
            addMarker();
          },
        ));
  }


  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }

  void addMarker() async {
    await addImageFromAsset("icon", "assets/symbols/custom-icon.png");
    mapController.addSymbol(const SymbolOptions(geometry: LatLng(25.321684, 82.987289), iconImage: "icon", draggable: true));
    mapController.setSymbolIconIgnorePlacement(false);
    mapController.setSymbolIconAllowOverlap(true);
  }

}