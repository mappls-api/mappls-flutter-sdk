
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class GeocodeWidget extends StatefulWidget {
  const GeocodeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GeocodeState();
  }

}

class _GeocodeState extends State {
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
        title: const Text('Geocode'),
      ),
      body: MapplsMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: (map) =>
          {
              controller = map,
          },
        onStyleLoadedCallback: () => {
            callGeocode()
        },
      ));
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImage(name, list);
  }

  void addMarker(LatLng latLng) async {
    await addImageFromAsset("icon", "assets/symbols/custom-icon.png");
    controller.addSymbol(SymbolOptions(geometry: latLng, iconImage: 'icon'));
    controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));
  }

  callGeocode() async{
    try {
      GeocodeResponse? response = await MapplsGeoCoding(address: "Saket")
          .callGeocoding();
      if (response != null && response.results != null &&
          response.results!.isNotEmpty) {
        addMarker(LatLng(
            response.results![0].latitude!, response.results![0].longitude!));
      }
    } catch(e) {
      if (e is PlatformException) {
        Fluttertoast.showToast(msg: '${e.code} --- ${e.message}');
      }
    }
  }

}