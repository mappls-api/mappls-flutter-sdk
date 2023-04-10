
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_place_widget/mappls_place_widget.dart';

class PlaceSearchWidget extends StatefulWidget {
  const PlaceSearchWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PlaceSearchState();
  }

}

class _PlaceSearchState extends State {

  ELocation _eLocation = ELocation();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Place Search UI'),
      ),
      body: Center(
          child: Column(
              children: [
                const SizedBox(height: 20,),
                Text(_eLocation.mapplsPin == null? 'Mappls Pin: ':'Mappls Pin: ${_eLocation.mapplsPin}'),
                const SizedBox(height: 20,),
                Text( _eLocation.placeName == null? 'Place Name: ': 'Place Name: ${_eLocation.placeName}'),
                const SizedBox(height: 20,),
                Text( _eLocation.placeAddress == null? 'Place Address: ': 'Place Address: ${_eLocation.placeAddress}'),
                const SizedBox(height: 20,),
                Text( _eLocation.latitude == null? 'Latitude: ': 'Latitude: ${_eLocation.latitude}'),
                const SizedBox(height: 20,),
                Text( _eLocation.longitude == null? 'Longitude: ': 'Longitude: ${_eLocation.longitude}'),
                const SizedBox(height: 20,),
                Text( _eLocation.type == null? 'Type: ': 'Type: ${_eLocation.type}'),
                const SizedBox(height: 20,),
                Text( _eLocation.entryLatitude == null? 'Entry Latitude: ': 'Entry Latitude: ${_eLocation.entryLatitude?.toString()}'),
                const SizedBox(height: 20,),
                Text( _eLocation.entryLongitude == null? 'Entry Longitude: ': 'Entry Longitude: ${_eLocation.entryLongitude?.toString()}'),
                const SizedBox(height: 20,),
                Text( _eLocation.orderIndex == null? 'Order Index: ': 'Order Index: ${_eLocation.orderIndex?.toString()}'),
                const SizedBox(height: 20,),
                Text( _eLocation.keywords == null? 'Keywords: ': 'Keywords: ${_eLocation.keywords?.toString()}'),
                const SizedBox(height: 20,),
                Text( _eLocation.typeX == null? 'Type X: ': 'Type X: ${_eLocation.typeX}'),
                const SizedBox(height: 20,),
                TextButton(onPressed: openMapplsSearchWidget ,child:const Text("Open Place Autocomplete")),
              ]
          )
        //    RaisedButton(onPressed: initPlatformState ,child: Text("Go to native"),)
      ),
    );
  }


  openMapplsSearchWidget() async {
    AutocompleteResult autocompleteResult;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      autocompleteResult = await openPlaceAutocomplete(
          PlaceOptions());
    } on PlatformException {
      autocompleteResult = AutocompleteResult();
    }
    if (kDebugMode) {
      print(json.encode(autocompleteResult.toJson()));
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    ELocation eLocation;
    if(autocompleteResult.eLocation != null) {
      eLocation = autocompleteResult.eLocation!;
    } else {
      eLocation = ELocation();
    }
    setState(() {
      _eLocation = eLocation;
    });
  }
}