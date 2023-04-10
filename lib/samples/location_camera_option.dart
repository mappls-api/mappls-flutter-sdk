import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class LocationCameraOption extends StatefulWidget {
  const LocationCameraOption({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LocationCameraOptionState();
  }
}

class _LocationCameraOptionState extends State {
  late MapplsMapController mapController;
  late bool isMapLoded;
  late MyLocationTrackingMode _myLocationTrackingMode;
  late MyLocationRenderMode _myLocationRenderMode;
  late String _slectedRenderModeText;
  List<MyLocationRenderMode> renderModeList = [
    MyLocationRenderMode.NORMAL,
    MyLocationRenderMode.COMPASS,
    MyLocationRenderMode.GPS,
  ];
  List<String> renderModeTextList = [
    "Normal",
    "Compass",
    "GPS",
  ];
  late String _selectedTrackingModeText;
  List<MyLocationTrackingMode> trackingModeList = [
    MyLocationTrackingMode.None,
    MyLocationTrackingMode.NoneCompass,
    MyLocationTrackingMode.NoneGPS,
    MyLocationTrackingMode.Tracking,
    MyLocationTrackingMode.TrackingCompass,
    MyLocationTrackingMode.TrackingGPS,
    MyLocationTrackingMode.TrackingGPSNorth,
  ];
  List<String> trackingModeTextList = [
    "None",
    "None Compass",
    "None GPS",
    "Tracking",
    "Tracking Compass",
    "Tracking GPS",
    "Tracking GPS North",
  ];

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 14.0,
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      isMapLoded = false;
      _myLocationRenderMode = renderModeList[0];
      _slectedRenderModeText = renderModeTextList[0];
      _myLocationTrackingMode = trackingModeList[3];
      _selectedTrackingModeText = trackingModeTextList[3];
    });
  }

  void _onMapCreated(MapplsMapController controller) {
    mapController = controller;
    setState(() {
      isMapLoded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Location Camera Option'),
      ),
      body: Column(
        children: [
          Expanded(
              child: MapplsMap(
            initialCameraPosition: _kInitialPosition,
            myLocationEnabled: true,
            myLocationTrackingMode: _myLocationTrackingMode,
            myLocationRenderMode: _myLocationRenderMode,
            onMapCreated: _onMapCreated,
          )),
          isMapLoded
              ? Container(
                  color: MyColor.colorPrimaryDark,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 4,
                      ),
                      renderModeWidget(),
                      const SizedBox(
                        width: 4,
                      ),
                      cameraModeWidget(),
                      const SizedBox(
                        width: 4,
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  renderModeWidget() {
    return Expanded(
        flex: 2,
        child: Row(children: [
          PopupMenuButton<int>(
            onSelected: (int index) => {
              setState(() => {
                    _myLocationRenderMode = renderModeList[index],
                    _slectedRenderModeText = renderModeTextList[index]
                  }),
              Fluttertoast.showToast(
                  msg: renderModeTextList[index],
                  toastLength: Toast.LENGTH_LONG)
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem(
                value: 0,
                child: Text(renderModeTextList[0]),
              ),
              PopupMenuItem(
                value: 1,
                child: Text(renderModeTextList[1]),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(renderModeTextList[2]),
              )
            ],
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: MyColor.colorPrimaryDark,
              child: Text(
                'Render:  $_slectedRenderModeText',
                style: const TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          )
        ]));
  }

  cameraModeWidget() {
    return Expanded(
        flex: 3,
        child: Row(children: [
          PopupMenuButton<int>(
            onSelected: (int index) => {
              setState(() => {
                    _myLocationTrackingMode = trackingModeList[index],
                    _selectedTrackingModeText = trackingModeTextList[index]
                  }),
              Fluttertoast.showToast(
                  msg: trackingModeTextList[index],
                  toastLength: Toast.LENGTH_LONG)
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem(
                value: 0,
                child: Text(trackingModeTextList[0]),
              ),
              PopupMenuItem(
                value: 1,
                child: Text(trackingModeTextList[1]),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(trackingModeTextList[2]),
              ),
              PopupMenuItem(
                value: 3,
                child: Text(trackingModeTextList[3]),
              ),
              PopupMenuItem(
                value: 4,
                child: Text(trackingModeTextList[4]),
              ),
              PopupMenuItem(
                value: 5,
                child: Text(trackingModeTextList[5]),
              ),
              PopupMenuItem(
                value: 6,
                child: Text(trackingModeTextList[6]),
              )
            ],
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: MyColor.colorPrimaryDark,
              child: Text(
                'Tracking:  $_selectedTrackingModeText',
                style: const TextStyle(color: Colors.white, fontSize: 14),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          )
        ]));
  }
}
