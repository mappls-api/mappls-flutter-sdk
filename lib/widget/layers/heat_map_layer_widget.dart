import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/Utils.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class HeatMapLayerWidget extends StatefulWidget {
  const HeatMapLayerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HeatMapLayerState();
  }
}

class _HeatMapLayerState extends State<HeatMapLayerWidget> {
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(22.553147478403194, 77.23388671875),
    zoom: 4.0,
  );

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
          'Heat Map',
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

      body: MapplsMap(
        initialCameraPosition: _cameraPosition,
        onMapCreated: (controller) {
          mapController = controller;
        },
        onStyleLoadedCallback: () {
          addHeatMapData();
        },
      ),
    );
  }

  void addHeatMapData() async {
    List features = Utils.heatMapOptions.map((option) {
      return {
        "type": "Feature",
        "properties": {"mag": option.mag},
        "geometry": {
          "type": "Point",
          "coordinates": [option.latLng.longitude, option.latLng.latitude],
        },
      };
    }).toList();
    final data = {"type": "FeatureCollection", "features": features};

    await mapController.addSource(
      "heatMapSourceId",
      GeojsonSourceProperties(data: data),
    );

    await mapController.addLayer(
      "heatMapSourceId",
      "heatMapLayerId",
      HeatmapLayerProperties(
        heatmapColor: [
          'interpolate',
          ['linear'],
          ['heatmap-density'], // Fixed: Use hyphenated expression name
          0, 'rgba(33,102,172,0)',
          0.2, 'rgb(9, 77, 116)',
          0.4, 'rgb(209,229,240)',
          0.6, 'rgb(239, 123, 56)',
          0.8, 'rgb(192, 66, 17)',
          1, 'rgb(178,24,43)',
        ],
        heatmapWeight: [
          'interpolate',
          ['linear'],
          ['get', 'mag'],
          0,
          0,
          6,
          1,
        ],
        heatmapIntensity: [
          'interpolate',
          ['linear'],
          ['zoom'],
          0,
          1,
          9,
          3,
        ],
        heatmapRadius: [
          'interpolate',
          ['linear'],
          ['zoom'],
          0,
          2,
          9,
          20,
        ],
        heatmapOpacity: 0.8,
      ),
    );

    await mapController.addLayer(
      'heatMapSourceId',
      'heatMapCircleLayerId',
      CircleLayerProperties(
        circleRadius: [
          'interpolate',
          ['linear'],
          ['zoom'],
          7,
          [
            'interpolate',
            ['linear'],
            ['get', 'mag'],
            1,
            1,
            6,
            4,
          ],
          16,
          [
            'interpolate',
            ['linear'],
            ['get', 'mag'],
            1,
            5,
            6,
            50,
          ],
        ],
        circleColor: [
          'interpolate',
          ['linear'],
          ['get', 'mag'],
          1, 'rgba(33, 102, 172, 0)',
          2, 'rgb(103, 169, 207)',
          3, 'rgb(209, 229, 240)',
          4, 'rgb(253, 219, 199)',
          5, 'rgb(239, 138, 98)',
          6, 'rgb(178, 24, 43)'
        ],
        circleOpacity: ['interpolate', ['linear'], ['zoom'], 7, 0, 8, 1],
        circleStrokeColor: 'white',
        circleStrokeWidth: 1,
      ),
      belowLayerId: 'heatMapLayerId'
    );
  }
}
