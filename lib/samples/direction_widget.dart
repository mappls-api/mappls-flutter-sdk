
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_flutter_sdk/utils/polyline.dart';
import 'package:mappls_gl/mappls_gl.dart';

class DirectionWidget extends StatefulWidget {
  const DirectionWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DirectionState();
  }

}

class _DirectionState extends State {

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );

  late MapplsMapController controller;
  List<String> profile = [
    DirectionCriteria.PROFILE_DRIVING,
    DirectionCriteria.PROFILE_BIKING,
    DirectionCriteria.PROFILE_WALKING,
  ];
  List<ResourceList> resource = [
    ResourceList(DirectionCriteria.RESOURCE_ROUTE, "Non Traffic"),
    ResourceList(DirectionCriteria.RESOURCE_ROUTE_ETA, "Route ETA"),
    ResourceList(DirectionCriteria.RESOURCE_ROUTE_TRAFFIC, "Traffic"),
  ];
  int selectedIndex = 0;
  late ResourceList selectedResource;
  DirectionsRoute? route;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedResource = resource[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Direction'),
      ),
      body: Column(children: [
        Expanded(
            child: Stack(children: [
              MapplsMap(
                initialCameraPosition: _kInitialPosition,
                onMapCreated: (map) =>
                {
                  controller = map,
                },
                onStyleLoadedCallback: () => {callDirection()},
              ),
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DefaultTabController(
                        length: 3,
                        child: TabBar(
                          tabs: const [
                            Tab(
                              icon: Icon(Icons.directions_car),
                              text: "Driving",
                            ),
                            Tab(
                              icon: Icon(Icons.directions_bike),
                              text: "Biking",
                            ),
                            Tab(
                              icon: Icon(Icons.directions_walk),
                              text: "Walking",
                            )
                          ],
                          onTap: (value) =>
                          {
                            setState(() {
                              selectedIndex = value;
                            }),
                            if (value != 0) {selectedResource = resource[0]},
                            callDirection()
                          },
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  selectedIndex == 0
                      ? Container(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: resource
                          .map((data) =>
                          Expanded(
                              child: RadioListTile(
                                  title: Text(
                                    data.text,
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                  value: selectedResource,
                                  groupValue: data,
                                  onChanged: (val) {
                                    setState(() {
                                      selectedResource = data;
                                    });
                                    callDirection();
                                  })))
                          .toList(),
                    ),
                  )
                      : Container()
                ],
              )
            ])),
        route != null
            ? Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Text(getDurationAndDistance(), style: const TextStyle(fontSize: 18),),
        )
            : Container()
      ]),
    );
  }


  String getDurationAndDistance() {
    return '${getFormattedDistance(route!.distance!.floor())}(${getFormattedDuration(route!.duration!.floor())})';
  }

  String getFormattedDuration(int duration) {
    int min = (duration % 3600 / 60).floor();
    int hours =  (duration % 86400 / 3600).floor();
    int days = (duration / 86400).floor();
    if (days > 0) {
      return '$days ${(days > 1 ? "Days" : "Day")} $hours hr ${(min > 0 ? "$min min": "")}';
    } else {
      return (hours > 0 ? '$hours hr ${(min > 0 ? "$min min" : "")}': '$min min');
    }
  }

  String getFormattedDistance(int distance) {

    if ((distance / 1000) < 1) {
      return '$distance mtr.';
    }
    return '${(distance/ 1000).toStringAsFixed(2)} Km.';
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImage(name, list);
  }


  callDirection() async {
    await addImageFromAsset("icon", "assets/symbols/custom-icon.png");

    controller.clearSymbols();
    controller.clearLines();
    setState(() {
      route = null;
    });
    try {
      DirectionResponse? directionResponse = await MapplsDirection(
          origin: const LatLng(28.594475, 77.202432),
          destination: const LatLng(28.554676, 77.186982),
          alternatives: false,
          steps: true,
          resource: selectedResource.value,
          profile: profile[selectedIndex])
          .callDirection();
      if (directionResponse != null &&
          directionResponse.routes != null &&
          directionResponse.routes!.isNotEmpty) {
        setState(() {
          route = directionResponse.routes![0];
        });
        Polyline polyline = Polyline.decode(
            encodedString: directionResponse.routes![0].geometry, precision: 6);
        List<LatLng> latlngList = [];
        if (polyline.decodedCoords != null) {
          polyline.decodedCoords?.forEach((element) {
            latlngList.add(LatLng(element[0], element[1]));
          });
        }
        if (directionResponse.waypoints != null) {
          List<SymbolOptions> symbols = [];
          directionResponse.waypoints?.forEach((element) {
            symbols.add(SymbolOptions(geometry: element.location, iconImage: 'icon'),);
          });
          controller.addSymbols(symbols);
        }
        drawPath(latlngList);
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    }
  }

  void drawPath(List<LatLng> latlngList) {
    controller.addLine(LineOptions(
      geometry: latlngList,
      lineColor: "#3bb2d0",
      lineWidth: 4,
    ));
    LatLngBounds latLngBounds = boundsFromLatLngList(latlngList);
    controller
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, top: 100, bottom: 20, left: 10, right: 10));
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
}

class ResourceList {
  final String value;
  final String text;

  ResourceList(this.value, this.text);
}