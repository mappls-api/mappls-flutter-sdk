import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class MapTrafficWidget extends StatefulWidget {
  const MapTrafficWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapTrafficState();
  }
}

class _MapTrafficState extends State<MapTrafficWidget> {
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(22.553147478403194, 77.23388671875),
    zoom: 4.0,
  );

  bool isMapLoaded = false;
  bool showTraffic = false;
  bool showFreeFlow = true;
  bool showNonFreeFlow = true;
  bool showClosure = true;
  bool showStopIcon = true;

  late MapplsMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // remove shadow to show separator
        backgroundColor: MapplsColor.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFC6D0F7)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Map Traffic',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // height of the line
          child: Container(
            color: Color(0x723C445B), // color of the line
            height: 1.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          MapplsMap(
            initialCameraPosition: _cameraPosition,
            onMapCreated: (controller) {
              mapController = controller;
              setState(() => isMapLoaded = true);
            },
          ),
          if (isMapLoaded)
            Positioned(
              top: 20,
              child: Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(6), // Add some padding
                decoration: BoxDecoration(
                  color: MapplsColor.primaryColor_95,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Show Traffic',
                          style: TextStyle(
                            fontSize: 14,
                            color: MapplsColor.primaryTextColor,
                          ),
                        ),
                        Switch.adaptive(
                          value: showTraffic,
                          onChanged: (value) {
                            mapController.enableTraffic(value);
                            setState(() {
                              showTraffic = value;
                            });
                          },
                          trackOutlineWidth: WidgetStatePropertyAll(0.0),
                          activeTrackColor: Color(0xFF00C4A1),
                          activeThumbColor: Color(0xFFFFFFFF),
                          inactiveThumbColor: Color(0xFFFFFFFF),
                          inactiveTrackColor: Color(0xFFEBEDEF),
                        ),
                      ],
                    ),
                    if (showTraffic)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: showFreeFlow,
                                onChanged: (value) {
                                  mapController.enableTrafficFreeFlow(value!);
                                  setState(() {
                                    showFreeFlow = value;
                                  });
                                },
                              ),
                              Text(
                                'Free Flow',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MapplsColor.primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: showNonFreeFlow,
                                onChanged: (value) {
                                  mapController.enableTrafficNonFreeFlow(value!);
                                  setState(() {
                                    showNonFreeFlow = value;
                                  });
                                },
                              ),
                              Text(
                                'Non Free Flow',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MapplsColor.primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: showClosure,
                                onChanged: (value) {
                                  mapController.enableTrafficClosure(value!);
                                  setState(() {
                                    showClosure = value;
                                  });
                                },
                              ),
                              Text(
                                'Show Closure',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MapplsColor.primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: showStopIcon,
                                onChanged: (value) {
                                  mapController.enableTrafficStopIcon(value!);
                                  setState(() {
                                    showStopIcon = value;
                                  });
                                },
                              ),
                              Text(
                                'Show Stop Icon',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MapplsColor.primaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
