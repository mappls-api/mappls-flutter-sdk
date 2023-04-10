
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_gl/mappls_gl.dart';
import 'package:turf/bearing.dart';
import 'package:turf/helpers.dart';

class TrackingPlugin {
  static const String car = "car_icon";
  static const String polylineSource = "polyline-source";
  static const String polylineLayer = "polyline-layer";
  static const String carSource = "car-source";
  static const String carLayer = "car-layer";
  static const String propertyBearing = "bearing";

  final MapplsMapController _controller;
  Animation<double>? _animation;
  AnimationController? _animationController;
  bool _isCallbackSent = false;
  final TickerProvider _tickerProvider;

  TrackingPlugin(
      this._controller, this._tickerProvider) {
    initSource();
  }

  void initSource() async {
    await addImageFromAsset(car, "assets/symbols/car.png");
    await addSource();
    await addLayer();
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return _controller.addImage(name, list);
  }

  Future<void> addSource() async {
    await _controller.addSource(
        polylineSource,
        const GeojsonSourceProperties(
            data: {"type": "FeatureCollection", "features": []}));
    return await _controller.addSource(
        carSource,
        const GeojsonSourceProperties(
            data: {"type": "FeatureCollection", "features": []}));
  }

  Future<void> addLayer() async {
    await _controller.addLineLayer(
        polylineSource,
        polylineLayer,
        const LineLayerProperties(
            // lineColor: Colors.black.toHexStringRGB(),
            lineWidth: 4,
            lineJoin: "round",
            lineCap: "round"));
    return await _controller.addSymbolLayer(
        carSource,
        carLayer,
        const SymbolLayerProperties(
            iconImage: car,
            iconRotate: [Expressions.get, propertyBearing],
            iconSize: 0.2,
            iconAllowOverlap: true,
            iconIgnorePlacement: true,
            iconRotationAlignment: "map"));
  }

  void drawPolyline(List<LatLng> latLngList) async {
    if (!_isCallbackSent) {
      List<List<double>> coordinates =
          latLngList.map((e) => [e.longitude, e.latitude]).toList();

      await _controller.setGeoJsonSource(polylineSource, {
        "type": "FeatureCollection",
        "features": [
          {
            "type": "Feature",
            "geometry": {"type": "LineString", "coordinates": coordinates},
          }
        ]
      });
    }
  }

  void addMarker(LatLng latLng) async {
    await _controller.setGeoJsonSource(carSource, {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "geometry": {
            "type": "Point",
            "coordinates": [latLng.longitude, latLng.latitude]
          },
          "properties": {propertyBearing: 0}
        }
      ]
    });
  }

  Future<void> animateMarker(LatLng start, LatLng next) async {
    _animationController = AnimationController(
        duration: const Duration(seconds: 5), vsync: _tickerProvider);
    Tween<double> tween = Tween(begin: 0, end: 1);

    double bearingData = bearing(
            Point(coordinates: Position(next.longitude, next.latitude)),
            Point(coordinates: Position(start.longitude, start.latitude)))
        .toDouble();
    _animation = tween.animate(_animationController!)
      ..addListener(() async {
        if (!_isCallbackSent) {
          final v = _animation!.value;

          double lng = v * next.longitude + (1 - v) * start.longitude;
          double lat = v * next.latitude + (1 - v) * start.latitude;
          LatLng newPos = LatLng(lat, lng);
          _controller.setGeoJsonSource(carSource, {
            "type": "FeatureCollection",
            "features": [
              {
                "type": "Feature",
                "geometry": {
                  "type": "Point",
                  "coordinates": [newPos.longitude, newPos.latitude],
                },
                "properties": {propertyBearing: bearingData}
              }
            ]
          });
        } else {
          _animationController?.removeListener(() {});
        }
      });

    return await _animationController?.forward();
  }

  void dispose() async {
    _isCallbackSent = true;
    _animationController?.reset();
    _animationController?.stop(canceled: false);
    _animationController?.dispose();
  }
}
