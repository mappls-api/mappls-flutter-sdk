
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class MapLongClickWidget extends StatefulWidget {
  const MapLongClickWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapLongClickState();
  }

}

class _MapLongClickState extends State<MapLongClickWidget> {

  static final CameraPosition _cameraPosition = CameraPosition(target: LatLng(22.553147478403194, 77.23388671875), zoom: 4.0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0,
          // remove shadow to show separator
          backgroundColor: MapplsColor.primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFFC6D0F7)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Map Long Tap',
            style: TextStyle(color: MapplsColor.primaryTextColor, fontSize: 20.0),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // height of the line
            child: Container(
              color: Color(0x723C445B), // color of the line
              height: 1.0,
            ),
          ),
        ),
        body: MapplsMap(
          initialCameraPosition: _cameraPosition,
          onMapLongClick: (point, latLng) => {
            Fluttertoast.showToast(msg: latLng.toString(), toastLength: Toast.LENGTH_SHORT)
          },
        )
    );
  }

}