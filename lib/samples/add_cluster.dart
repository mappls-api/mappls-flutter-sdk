

import 'package:flutter/material.dart';
import 'package:mappls_flutter_sdk/plugin/cluster_marker_plugin.dart';
import 'package:mappls_gl/mappls_gl.dart';

import '../model/cluster_list.dart';
import '../utils/color.dart';

class AddCluster extends StatefulWidget {
  const AddCluster({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddClusterState();
  }

}

class _AddClusterState extends State {
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 14.0,
  );
  late MapplsMapController mapController;
  ClusterMarkerPlugin? _clusterMarkerPlugin;
  List<ClusterList> list = [
    ClusterList("pin2", const LatLng(28.551635, 77.268805)),
    ClusterList("pin2", const LatLng(28.551635, 77.268805)),
    ClusterList("pin2", const LatLng(28.551041, 77.267979)),
    ClusterList("pin2", const LatLng(28.552115, 77.265833)),
    ClusterList("pin2", const LatLng(28.559786, 77.238859)),
    ClusterList("pin2", const LatLng(28.561535, 77.233345)),
    ClusterList("pin2", const LatLng(28.562469, 77.235072)),
    ClusterList("pin2", const LatLng(28.435931, 77.304689)),
    ClusterList("pin2", const LatLng(28.436214, 77.304936)),
    ClusterList("pin", const LatLng(28.438827, 77.308337)),
    ClusterList("pin", const LatLng(28.489028, 77.091252)),
    ClusterList("pin", const LatLng(28.486831, 77.094492)),
    ClusterList("pin", const LatLng(28.486491, 77.094374)),
    ClusterList("pin", const LatLng(28.491510, 77.082149)),
    ClusterList("pin", const LatLng(28.474800, 77.065233)),
    ClusterList("pin", const LatLng(28.471245, 77.072722)),
    ClusterList("pin", const LatLng(28.458440, 77.073179)),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.colorPrimary,
          title: const Text('Add Cluster'),
        ),
        body: MapplsMap(
          initialCameraPosition: _kInitialPosition,
          onMapCreated: (mapController) {
            this.mapController = mapController;
            _onMapCreated(mapController);
          },
          onStyleLoadedCallback: () async => {
            _clusterMarkerPlugin = ClusterMarkerPlugin(mapController),
            await Future.delayed(Duration(seconds: 3)),
          _clusterMarkerPlugin?.setMarker(list),

          },
        ));
  }

  void _onMapCreated(MapplsMapController _mapController) async {
    List<LatLng> latLngList = list.map((item) => item.position).toList();

    if (latLngList.isNotEmpty) {
      final bounds = LatLngBounds(
        southwest: LatLng(
          latLngList.map((e) => e.latitude).reduce((a, b) => a < b ? a : b),
          latLngList.map((e) => e.longitude).reduce((a, b) => a < b ? a : b),
        ),
        northeast: LatLng(
          latLngList.map((e) => e.latitude).reduce((a, b) => a > b ? a : b),
          latLngList.map((e) => e.longitude).reduce((a, b) => a > b ? a : b),
        ),
      );

      await _mapController.animateCamera(CameraUpdate.newLatLngBounds(
        bounds, left: 10.0,right: 10.0,top: 10.0,bottom: 10.0
      ));
    }
  }

}