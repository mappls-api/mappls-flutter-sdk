
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_flutter_sdk/plugin/tracking_plugin.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_flutter_sdk/utils/polyline.dart';
import 'package:mappls_gl/mappls_gl.dart';

class TrackingWidget extends StatefulWidget {
  const TrackingWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TrackingState();
  }

}

class _TrackingState extends State with TickerProviderStateMixin {

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(19.15183700, 72.93374500),
    zoom: 10.0,
  );

  late MapplsMapController? controller;
  TrackingPlugin? _trackingPlugin;
  List<LatLng> _travelledPoints = [];
  int _index = 0;

  bool isDispose = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorPrimary,
        title: const Text('Tracking'),
      ),
      body: MapplsMap(
        initialCameraPosition: _kInitialPosition,
        onMapError: (code, message) => {print('$code -------- $message')},
        onMapCreated: (map) => {controller = map},
        onStyleLoadedCallback: () async =>
        {_trackingPlugin = TrackingPlugin(controller!, this), callRouteETA()},
      ),
    );
  }

  callTravelledRoute() async {
    if (_index < _travelledPoints.length) {
      try {
        DirectionResponse? directionResponse = await MapplsDirection(
            origin: _travelledPoints.elementAt(_index),
            destination: const LatLng(19.1478, 72.9344),
            alternatives: false,
            steps: true,
            routeType: 1,
            resource: DirectionCriteria.RESOURCE_ROUTE)
            .callDirection();

        if (directionResponse != null &&
            directionResponse.routes != null &&
            directionResponse.routes!.isNotEmpty) {
          Polyline polyline = Polyline.decode(
              encodedString: directionResponse.routes![0].geometry,
              precision: 6);
          List<LatLng> latlngList = [];
          if (polyline.decodedCoords != null) {
            polyline.decodedCoords?.forEach((element) {
              latlngList.add(LatLng(element[0], element[1]));
            });
            if (mounted && !isDispose) {
              _trackingPlugin?.drawPolyline(latlngList);

              await controller?.moveCamera(CameraUpdate.newLatLngBounds(
                  boundsFromLatLngList(latlngList),
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 10));
            }
          }
        }
      } on PlatformException catch (e) {
        if (kDebugMode) {
          print(e.code);
        }
      }
    }
  }

  boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null || x1 == null || y0 == null || y1 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  callRouteETA() async {
    try {
      DirectionResponse? directionResponse = await MapplsDirection(
          origin: const LatLng(19.15183700, 72.93374500),
          destination: const LatLng(19.1478, 72.9344),
          alternatives: false,
          steps: true,
          overview: DirectionCriteria.OVERVIEW_SIMPLIFIED,
          resource: DirectionCriteria.RESOURCE_ROUTE_ETA)
          .callDirection();

      if (directionResponse != null &&
          directionResponse.routes != null &&
          directionResponse.routes!.isNotEmpty) {
        Polyline polyline = Polyline.decode(
            encodedString: directionResponse.routes![0].geometry, precision: 6);
        List<LatLng> latLngList = [];
        if (polyline.decodedCoords != null) {
          polyline.decodedCoords?.forEach((element) {
            latLngList.add(LatLng(element[0], element[1]));
          });
          _travelledPoints = latLngList;
          callTravelledRoute();
          _trackingPlugin?.addMarker(latLngList.first);
          updateIconMarker();
        }
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    }
  }

  @override
  void dispose() {
    isDispose = true;
    _trackingPlugin?.dispose();
    controller = null;
    _trackingPlugin = null;
    super.dispose();
  }

  void updateIconMarker() async {
    await Future.delayed(const Duration(seconds: 6));
    if(_index < _travelledPoints.length - 1 && mounted && !isDispose){
      await _trackingPlugin?.animateMarker(_travelledPoints.elementAt(_index), _travelledPoints.elementAt(_index + 1));
      _index++;
      if(mounted && !isDispose) {
        callTravelledRoute();
        updateIconMarker();
      }
    }
  }
}