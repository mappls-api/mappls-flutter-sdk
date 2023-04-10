
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_direction_plugin/mappls_direction_plugin.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';

class DirectionUIWidget extends StatefulWidget {
  const DirectionUIWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DirectionUIState();
  }

}

class _DirectionUIState extends State {

  DirectionCallback _directionCallback = DirectionCallback(null, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Direction Widget'),
      ),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Text(_directionCallback.selectedIndex == null
                ? 'Selected Index: '
                : 'Selected Index: ${_directionCallback.selectedIndex}'),
            const SizedBox(
              height: 20,
            ),
            Text(_directionCallback.directionResponse?.routes == null
                ? 'Distance: '
                : 'Distance: ${_directionCallback.directionResponse?.routes![0].distance}'),
            const SizedBox(
              height: 20,
            ),
            Text(_directionCallback.directionResponse?.routes == null
                ? 'Duration: '
                : 'Duration: ${_directionCallback.directionResponse?.routes![0].duration}'),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                child: const Text('Open Direction Widget'),
                onPressed: () => {openMapplsDirectionWidget()})
          ]),
        )
    );
  }

  Future<void> openMapplsDirectionWidget() async {
    DirectionCallback directionCallback;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      directionCallback = await openDirectionWidget();
    } on PlatformException {
      directionCallback = DirectionCallback(null, null);
    }
    if (kDebugMode) {
      print(json.encode(directionCallback.directionResponse?.toMap()));
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _directionCallback = directionCallback;
    });
  }
}