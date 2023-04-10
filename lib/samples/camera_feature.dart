import 'package:flutter/material.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class CameraFeature extends StatefulWidget {
  const CameraFeature({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CameraFeatureState();
  }
}

class _CameraFeatureState extends State {
  late MapplsMapController mapController;
  bool isMapLoaded = false;

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 14.0,
  );

  void _onMapCreated(MapplsMapController controller) {
    mapController = controller;
    setState(() {
      isMapLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Camera Feature'),
      ),
      body: Column(
        children: [
          Expanded(
              child: MapplsMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: _onMapCreated,
          )),
          isMapLoaded
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: TextButton(
                            onPressed: () => {
                                  if (mapController != null)
                                    {
                                      mapController.moveCamera(
                                          CameraUpdate.newLatLngZoom(
                                              const LatLng(22.553147478403194,
                                                  77.23388671875),
                                              14))
                                    }
                                },
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    MyColor.colorPrimaryDark),
                                textStyle: MaterialStatePropertyAll(
                                    TextStyle(color: Colors.white))),
                            child: const Text('Move Camera', style: TextStyle(color: Colors.white)))),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: TextButton(
                            onPressed: () => {
                                  if (mapController != null)
                                    {
                                      mapController.easeCamera(
                                          CameraUpdate.newLatLngZoom(
                                              const LatLng(
                                                  28.704268, 77.103045),
                                              14))
                                    }
                                },
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    MyColor.colorPrimaryDark),
                                textStyle: MaterialStatePropertyAll(
                                    TextStyle(color: Colors.white))),
                            child: const Text('Ease Camera', style: TextStyle(color: Colors.white)))),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: TextButton(
                            onPressed: () => {
                                  if (mapController != null)
                                    {
                                      mapController.animateCamera(
                                          CameraUpdate.newLatLngZoom(
                                              const LatLng(
                                                  28.698791, 77.121243),
                                              14))
                                    }
                                },
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    MyColor.colorPrimaryDark)),

                            child: const Text('Animate Camera', style: TextStyle(color: Colors.white),))),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
