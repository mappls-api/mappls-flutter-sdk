
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class AutosuggestWidget extends StatefulWidget {
  const AutosuggestWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AutosuggestState();
  }

}

class _AutosuggestState extends State {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );
  late MapplsMapController controller;
  List<ELocation> _elocation = [];
  bool showAutoSuggestWidget = false;
  TextEditingController textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Autosuggest'),
      ),
      body: Stack(
        children: [
          MapplsMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: (map) => {
              controller = map,
            },
            onStyleLoadedCallback: () => {
              setState(() {
                showAutoSuggestWidget = true;
              })
            },
          ),
          showAutoSuggestWidget ? autosuggestWidget() : Container(),
        ],
      ),
    );
  }



  Widget autosuggestWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                    hintText: "Search Here", fillColor: Colors.white),
                maxLines: 1,
                onChanged: (text) {
                  callAutoSuggest(text);
                })),
        const SizedBox(
          height: 20,
        ),
        _elocation.isNotEmpty
            ? Expanded(
            child: Container(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                    itemCount: _elocation.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        focusColor: Colors.white,
                        title: Text(_elocation[index].placeName ?? ''),
                        subtitle: Text(
                          _elocation[index].placeAddress ?? '',
                          maxLines: 2,
                        ),
                        onTap: () {
                          addMarker(_elocation[index]);
                          setState(() {
                            _elocation = [];
                          });
                          textController.text = '';
                        },
                      );
                    })))
            : Container()
      ],
    );
  }



  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller.addImage(name, list);
  }

  void addMarker(ELocation eLocation) async {
    await addImageFromAsset("icon", "assets/symbols/custom-icon.png");
    LatLng latLng = LatLng(eLocation.latitude!, eLocation.longitude!);
    controller.addSymbol(SymbolOptions(geometry: latLng, iconImage: 'icon'));
    controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 14));
  }

  void callAutoSuggest(String text) async {
    if (text.length > 2) {
      try {
        AutoSuggestResponse? response = await MapplsAutoSuggest(query: text).callAutoSuggest();
        if (response != null && response.suggestedLocations != null) {
          setState(() {
            _elocation = response.suggestedLocations!;
          });
        } else {
          setState(() {
            _elocation = [];
          });
        }
      } catch (e) {
        if (e is PlatformException) {
          Fluttertoast.showToast(msg: '${e.code} --- ${e.message}');
        }
      }
    } else {
      setState(() {
        _elocation = [];
      });
    }
  }
}
