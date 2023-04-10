import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class PlaceDetailWidget extends StatefulWidget {
  const PlaceDetailWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PlaceDetailWidget();
  }
}

class _PlaceDetailWidget extends State {
  PlaceDetailResponse? place;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.colorPrimary,
          title: const Text('Place Detail'),
        ),
        body: Center(
            child: Column(children: [
          TextFormField(
            controller: controller,
            maxLength: 6,
            decoration: const InputDecoration(
                hintText: "Mappls Pin(e.g., MMI000)", fillColor: Colors.white),
          ),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () {
                callPlaceDetail();
              },
              child: const Text("Submit")),
          const SizedBox(height: 10),
          place?.mapplsPin == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text('Mappls Pin: ${place?.mapplsPin}')),
          place?.latitude == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text('Latitude: ${place?.latitude}')),
          place?.longitude == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text('Latitude: ${place?.longitude}')),
          place?.state == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text('STATE: ${place?.state}')),
          place?.city == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text('City: ${place?.city}')),
          place?.address == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text('Address: ${place?.address}')),
          place?.placeName == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text('Place Name: ${place?.placeName}')),
          place?.type == null
              ? Container()
              : Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text('Type: ${place?.type}')),
        ])));
  }


  void callPlaceDetail() async {
    if (controller.text.isNotEmpty) {
      PlaceDetailResponse? placeDetailResponse;
      try {
        placeDetailResponse = await MapplsPlaceDetail(mapplsPin: controller.text)
            .callPlaceDetail();
      } on PlatformException catch (e) {
        Fluttertoast.showToast(msg: '${e.code}----${e.message}');
      }

      setState(() {
        place = placeDetailResponse;
      });
    }
  }
}
