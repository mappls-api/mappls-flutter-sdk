import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_nearby_plugin/mappls_nearby_plugin.dart';

class NearbyUIWidget extends StatefulWidget {
  const NearbyUIWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NearbyUIState();
  }
}

class _NearbyUIState extends State {
  NearbyResult? _nearbyResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: MyColor.colorPrimary,
            title: const Text('Nearby UI')),
        body: Center(
            child: Column(children: [
          const SizedBox(height: 20),
          Text(_nearbyResult?.distance == null
              ? 'Distance: '
              : 'Distance: ${_nearbyResult?.distance}'),
          const SizedBox(height: 20),
          Text(_nearbyResult?.mapplsPin == null
              ? 'Mappls Pin: '
              : 'Mappls Pin: ${_nearbyResult?.mapplsPin}'),
          const SizedBox(height: 20),
          Text(_nearbyResult?.placeName == null
              ? 'Place Name: '
              : 'Place Name: ${_nearbyResult?.placeName}'),
          const SizedBox(height: 20),
          Text(_nearbyResult?.placeAddress == null
              ? 'Place Address: '
              : 'Place Address: ${_nearbyResult?.placeAddress}'),
          const SizedBox(height: 20),
          Text(_nearbyResult?.orderIndex == null
              ? 'Index: '
              : 'Index: ${_nearbyResult?.orderIndex}'),
          const SizedBox(height: 20),
          TextButton(
              child: const Text('Open Nearby Search Widget'),
              onPressed: () => {
                    openMapplsNearbyWidget(),
                  })
        ])));
  }

  void openMapplsNearbyWidget() async {
    NearbyResult nearbyResult;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      nearbyResult = await openNearbyWidget();
    } on PlatformException {
      nearbyResult = NearbyResult();
    }
    if (kDebugMode) {
      print(json.encode(nearbyResult.toJson()));
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _nearbyResult = nearbyResult;
    });
  }
}
