
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_place_widget/mappls_place_widget.dart';

class PlacePickerWidget extends StatefulWidget {
  const PlacePickerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PlacePickerState();
  }

}

class _PlacePickerState extends State {
  ReverseGeocodePlace _place = ReverseGeocodePlace();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Place Picker'),
      ),
        body: Center(child: Column(children: [
          const SizedBox(height: 20,),
          Text(_place.formattedAddress == null? 'Address: ':'Address: ${_place.formattedAddress}' ),
          const SizedBox(height: 20,),
          TextButton(onPressed: openMapplsPlacePickerWidget ,child: const Text("Open Place picker")),
        ]))
    );
  }

  openMapplsPlacePickerWidget() async {
    ReverseGeocodePlace place;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      place = await openPlacePicker(
          PickerOption());
    } on PlatformException {
      place = ReverseGeocodePlace();
    }
    if (kDebugMode) {
      print(json.encode(place.toJson()));
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _place = place;
    });
  }

}