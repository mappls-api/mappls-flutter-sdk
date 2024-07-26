
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mappls_gl/mappls_gl.dart';

import 'package:turf/along.dart';

import '../model/cluster_list.dart';

class ClusterMarkerPlugin {
  static const String clusterMarkerSource = "cluster-marker-source";
  static const String unClusterMarkerLayer = "un-cluster-marker-layer";
  static const String clusterCircleLayer = "cluster-circle-layer";
  static const String clusterCountLayer = "cluster-count-layer";
  static const String markerIconProperty = "marker-icon-property";
  static const String markerColorProperty = "marker-color-property";
  static const String pointCountText = "point_count";
  static const String markerClusterProperty = "marker-color-property";

  final MapplsMapController _mapController;

  FeatureCollection featureCollection = FeatureCollection();

  ClusterMarkerPlugin(this._mapController) {
    initSource();
  }


  Future<void> initSource() async {
    await addImages();
    await addSource();
    await unClusterLayer();
    await clusterLayer();
    await countLayer();
  }

  addImages() async {
    await addImageFromAsset("pin", "assets/symbols/custom-icon.png");
    await addImageFromAsset("pin2", "assets/symbols/ic_map_marker_blue.png");
  }

  /// Adds an asset image to the currently displayed style
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return _mapController.addImage(name, list);
  }

  // {"type": "FeatureCollection", "features": []}
  addSource() async {
      await _mapController.removeSource(clusterMarkerSource);
      return await _mapController.addSource(
          clusterMarkerSource,
          const GeojsonSourceProperties(
              data:{"type": "FeatureCollection", "features": []},
              cluster: true,
              clusterMaxZoom: 14,
              clusterRadius: 50));
  }

  unClusterLayer() async {
    await _mapController.removeLayer(unClusterMarkerLayer);
    return await _mapController.addLayer(
        clusterMarkerSource,
        unClusterMarkerLayer,
        const SymbolLayerProperties(
          iconImage:[Expressions.get, markerIconProperty],
          iconSize: 0.8,
       ),
      filter: [Expressions.has,markerClusterProperty]
       );
  }



  clusterLayer() async {
    List<List<dynamic>> layers = [
      [10, '#1565c0'],
      [5, '#1565c0'],
      [0, '#1565c0'],
    ];
    for (int i = 0; i < layers.length; i++) {
      String circleColorHex = layers[i][1]; // Color should be in hex string format
      int markerCount = layers[i][0];

      // Remove existing cluster circle layer
      await _mapController.removeLayer("$clusterCircleLayer$i");

      // Add new cluster circle layer
      await _mapController.addLayer(
        clusterMarkerSource,
        "$clusterCircleLayer$i",
        CircleLayerProperties(
          circleColor: circleColorHex, // Use hex color string
          circleRadius: 18.0,
          // Optionally add filter expression

        ),
        filter: i == 0 ? [Expressions.all, [Expressions.has, pointCountText]]: [Expressions.all, [Expressions.has, pointCountText]
        ]
      );
    }
  }
  countLayer() async {
    await _mapController.removeLayer(clusterCountLayer);
    await _mapController.addLayer(
        clusterMarkerSource,
        clusterCountLayer,
        const SymbolLayerProperties(
          textField: [Expressions.get, pointCountText],
          textSize: 14,
          textColor: '#ffffff',
          textIgnorePlacement: true,
          textAllowOverlap: true
        ));
  }

 void setMarker(List<ClusterList> latLngList) async{
   List<dynamic> features = [];

   if (latLngList.isNotEmpty) {
     for (var latLng in latLngList) {
       final feature = {
         "type": "Feature",
         "geometry": {"type": "Point", "coordinates": [latLng.position.longitude,latLng.position.latitude]},
         "properties": {
           markerIconProperty: latLng.markerIcon,
           markerClusterProperty: true
         }
       };
       features.add(feature);
     }

     await _mapController.setGeoJsonSource(clusterMarkerSource, {
       "type": "FeatureCollection",
       "features": features
     });

    }
  }

  void moveCameraToLeavesBounds(FeatureCollection featureCollectionToInspect) async {
    List<LatLng> latLngList = [];
    if (featureCollectionToInspect.features != null) {
      for (var singleClusterFeature in featureCollectionToInspect.features) {
        var geometry = singleClusterFeature.geometry as Point;
        if (geometry != null) {
          latLngList.add(LatLng(geometry.coordinates[1]!.ceilToDouble(), geometry.coordinates[0]!.ceilToDouble()));
        }
      }
      if (latLngList.length > 1) {
        var bounds = _computeLatLngBounds(latLngList);
        _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, left: 20, top: 20, bottom: 20, right: 20));
      }
    }
  }

  LatLngBounds _computeLatLngBounds(List<LatLng> latLngList) {
    double? minLat, maxLat, minLng, maxLng;

    for (LatLng latLng in latLngList) {
      if (minLat == null || latLng.latitude < minLat) {
        minLat = latLng.latitude;
      }
      if (maxLat == null || latLng.latitude > maxLat) {
        maxLat = latLng.latitude;
      }
      if (minLng == null || latLng.longitude < minLng) {
        minLng = latLng.longitude;
      }
      if (maxLng == null || latLng.longitude > maxLng) {
        maxLng = latLng.longitude;
      }
    }

    return LatLngBounds(
      southwest: LatLng(minLat!, minLng!),
      northeast: LatLng(maxLat!, maxLng!),
    );
  }





}





