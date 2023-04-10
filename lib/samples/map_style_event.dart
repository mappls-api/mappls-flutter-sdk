
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class MapStyleEvent extends StatefulWidget {
  const MapStyleEvent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapStyleState();
  }
}

class _MapStyleState extends State {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(28.551087, 77.257373),
    zoom: 14.0,
  );

  bool isMapLoaded = false;

  String? style;
  bool isSelectedLastStyle = false;
  MapplsMapController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Map Style'),
      ),
      body: Column(
        children: [
          Expanded(
              child: MapplsMap(
            initialCameraPosition: _kInitialPosition,
            mapplsStyle: style,
            onMapError: (code, message) =>
                {debugPrint('$code -------- $message')},
            onMapCreated: (map) => {
              debugPrint("onMapCreated"),
              controller = map,
              controller?.enableTraffic(true),
              setState(() {
                isMapLoaded = true;
              })
            },
            onStyleLoadedCallback: () => {addMarker()},
            annotationOrder: const [
              AnnotationType.fill,
              AnnotationType.circle,
              AnnotationType.line,
              AnnotationType.symbol,
            ],
          )),
          isMapLoaded
              ? Row(children: [
                  Checkbox(
                      value: isSelectedLastStyle,
                      onChanged: (isCheck) async {
                        await MapplsMapConfiguration.setShowLastSelectedStyle(
                            isCheck!);
                        setSelectedLastStyle();
                      }),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text("Show Last Selected Style")
                ])
              : Container(),
          isMapLoaded
              ? TextButton(
                  onPressed: () {
                    showStylesList();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: MyColor.colorPrimaryDark,
                      textStyle: const TextStyle(color: Colors.white)),
                  child: const Text(
                    "Show Style List",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  showStylesList() async {
    List<MapplsStyle> mapplsStyles =
    await controller?.getMapplsAvailableStyles() ?? [];
    if(mounted) {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return Expanded(
              child: ListView.builder(
                  itemCount: mapplsStyles.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(bottom: BorderSide())),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(5),
                          focusColor: Colors.white,
                          title: Text(mapplsStyles[index].displayName ?? ''),
                          subtitle: Text(
                            mapplsStyles[index].description ?? '',
                            maxLines: 2,
                          ),
                          onTap: () {
                            setState(() {
                              style = mapplsStyles[index].name;
                            });
                          },
                        ));
                  }));
        },
      );
    }
  }

  setSelectedLastStyle() async {
    bool isSelected =
    await MapplsMapConfiguration.isShowLastSelectedStyle();
    setState(() {
      isSelectedLastStyle = isSelected;
    });
  }

  void addMarker() async {
    print("ON Style Loaded");

    await addImageFromAsset("icon", "assets/symbols/custom-icon.png");
    controller?.addSymbol(const SymbolOptions(
        geometry: LatLng(25.321684, 82.987289),
        draggable: true,
        iconImage: 'icon'));
    controller?.setSymbolIconIgnorePlacement(false);
    controller?.setSymbolIconAllowOverlap(true);
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller?.addImage(name, list);
  }
}
