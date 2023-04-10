import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_flutter_sdk/utils/polyline.dart';
import 'package:mappls_gl/mappls_gl.dart';

class PoiAlongRouteWidget extends StatefulWidget {
  const PoiAlongRouteWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PoiAlongRouteState();
  }
}

class _PoiAlongRouteState extends State {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );

  TextEditingController sourceController =
      TextEditingController(text: "28.594475,77.202432");
  TextEditingController destinationController =
      TextEditingController(text: "28.554676,77.186982");
  TextEditingController keywordController =
      TextEditingController(text: "FODCOF");

  List<SuggestedPOI> result = [];
  bool isShowList = false;

  late MapplsMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('POI Along Route'),
      ),
      body: Stack(children: <Widget>[
        MapplsMap(
          initialCameraPosition: _kInitialPosition,
          onMapCreated: (map) => {
            controller = map,
          },
          onStyleLoadedCallback: () {
            callDirection();
          },
          onMapLongClick: (point, latlng) {
            openDialog(latlng);
          },
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                            controller: sourceController,
                            decoration: const InputDecoration(
                                hintText: "Source(e.g.,Lat,Lng/Mappls pin)",
                                fillColor: Colors.white),
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                            controller: destinationController,
                            decoration: const InputDecoration(
                                hintText: "Destination(e.g.,Lat,Lng/Mappls pin)",
                                fillColor: Colors.white),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: keywordController,
                          decoration: const InputDecoration(
                              hintText: "e.g.,Tea", fillColor: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextButton(
                              onPressed: () => {
                                callDirection()
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      MyColor.colorPrimary),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(color: Colors.white))),
                              child: const Text("Submit")))
                    ],
                  ),
                ])),
        result.isNotEmpty && isShowList
            ? BottomSheet(
            onClosing: () => {},
            builder: (context) => ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(5),
                            focusColor: Colors.white,
                            title: Text(result[index].address ?? ''),
                          ));
                    }))
            : Container()
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            isShowList = !isShowList;
          })
        },
        child: isShowList ? const Icon(Icons.map) : const Icon(Icons.list),
      ),
    );
  }



  Future<void> openDialog(LatLng latLng) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Select Point as Source or Destination'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Source'),
              onPressed: () {
                sourceController.text = "${latLng.latitude},${latLng.longitude}";
                callDirection();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Destination'),
              onPressed: () {
                destinationController.text = "${latLng.latitude},${latLng.longitude}";
                callDirection();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  callDirection() async {
    try {
      setState(() {
        result = [];
      });
      controller.clearLines();
      controller.clearSymbols();
      LatLng? source;
      String? sourceMapplsPin;
      LatLng? destination;
      String? destinationMapplsPin;

      if (sourceController.text.isEmpty ||
          destinationController.text.isEmpty ||
          keywordController.text.isEmpty) {
        return;
      }
      if (sourceController.text.contains(",")) {
        source = LatLng(
          double.parse(sourceController.text.split(",")[0]),
          double.parse(sourceController.text.split(",")[1]),
        );
      } else {
        sourceMapplsPin = sourceController.text;
      }
      if (destinationController.text.contains(",")) {
        destination = LatLng(
          double.parse(destinationController.text.split(",")[0]),
          double.parse(destinationController.text.split(",")[1]),
        );
      } else {
        destinationMapplsPin = destinationController.text;
      }

      DirectionResponse? directionResponse = await MapplsDirection(
          origin: source,
          originMapplsPin: sourceMapplsPin,
          destination: destination,
          destinationMapplsPin: destinationMapplsPin)
          .callDirection();
      if (directionResponse != null &&
          directionResponse.routes != null &&
          directionResponse.routes!.isNotEmpty) {
        Polyline polyline = Polyline.decode(
            encodedString: directionResponse.routes![0].geometry, precision: 6);
        List<LatLng> latLngList = [];
        if (polyline.decodedCoords != null) {
          polyline.decodedCoords?.forEach((element) {
            latLngList.add(LatLng(element[0], element[1]));
          });
        }
        drawPath(latLngList);
        callPOIAlongRoute(directionResponse.routes![0]);
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    }
  }

  void drawPath(List<LatLng> latlngList) {
    controller.addLine(
        LineOptions(geometry: latlngList, lineColor: "#3bb2d0", lineWidth: 4));
    LatLngBounds latLngBounds = boundsFromLatLngList(latlngList);
    controller.animateCamera(CameraUpdate.newLatLngBounds(latLngBounds));
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
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImage(name, list);
  }

  void callPOIAlongRoute(DirectionsRoute directionsRoute) async {
    await addImageFromAsset("icon", "assets/symbols/custom-icon.png");

    await controller.clearSymbols();
    PoiAlongRouteResponse? poiAlongRouteResponse =
    await MapplsPOIAlongRoute(
        path: directionsRoute.geometry!,
        category: keywordController.text,
        buffer: 300)
        .callPOIAlongRoute();
    if (poiAlongRouteResponse != null &&
        poiAlongRouteResponse.suggestedPOIs != null &&
        poiAlongRouteResponse.suggestedPOIs!.isNotEmpty) {
      setState(() {
        result = poiAlongRouteResponse.suggestedPOIs!;
      });
      List<SymbolOptions> options = [];
      poiAlongRouteResponse.suggestedPOIs?.forEach((element) {
        // print('${element.placeName} (${element.distance})');
        if (kDebugMode) {
          print(json.encode(element.toJson()));
        }
        options.add(SymbolOptions(
            geometry: LatLng(element.latitude!, element.longitude!), iconImage: 'icon'));
      });
      controller.addSymbols(options);
    }
  }
}
