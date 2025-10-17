import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/Utils.dart';
import 'package:mappls_flutter_demo/utils/geo_analytics_model.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class GeoAnalyticsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GeoAnalyticsState();
  }
}

class _GeoAnalyticsState extends State<GeoAnalyticsWidget> {
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(22.553147478403194, 77.23388671875),
    zoom: 4.0,
  );

  late MapplsMapController mapController;
  bool isMapLoaded = false;

  @override
  Widget build(BuildContext context) {
    final List<GeoAnalyticsDataModel> geoAnalyticsData = Utils.geoAnalyticsList;
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
          'GeoAnalytics Plugin',
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
      body: Stack(
        children: [
          MapplsMap(
            initialCameraPosition: _cameraPosition,
            onMapCreated: (controller) {
              mapController = controller;
            },
            onStyleLoadedCallback: () {
              setState(() {
                isMapLoaded = true;
              });
            },
          ),
          if (isMapLoaded)
            DraggableScrollableSheet(
              initialChildSize: 0.1, // 20% of screen height
              minChildSize: 0.1,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: MapplsColor.primaryColor_95,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: geoAnalyticsData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  geoAnalyticsData[index].geoAnalyticsType.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: MapplsColor.primaryTextColor,
                                  ),
                                ),
                                Switch.adaptive(
                                  value: false,
                                  onChanged: (value) {
                                    showHideGeoAnalytics(
                                      value,
                                      geoAnalyticsData[index],
                                    );
                                  },
                                  trackOutlineWidth: WidgetStatePropertyAll(
                                    0.0,
                                  ),
                                  activeTrackColor: Color(0xFF00C4A1),
                                  activeThumbColor: Color(0xFFFFFFFF),
                                  inactiveThumbColor: Color(0xFFFFFFFF),
                                  inactiveTrackColor: Color(0xFFEBEDEF),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
            ),
        ],
      ),
    );
  }

  void showHideGeoAnalytics(
    bool value,
    GeoAnalyticsDataModel geoAnalyticsData,
  ) async {
    if (value) {
      await mapController.showGeoAnalytics(
        type: geoAnalyticsData.geoAnalyticsType,
        geoboundType: geoAnalyticsData.geoBoundType,
        geobound: geoAnalyticsData.geoAnalyticsParams,
        propertyNames: geoAnalyticsData.propertyName,
      );
    } else {
      await mapController.removeGeoAnalytics(
        type: geoAnalyticsData.geoAnalyticsType,
        geoboundType: geoAnalyticsData.geoBoundType,
        geobound: geoAnalyticsData.geoAnalyticsParams,
        propertyNames: geoAnalyticsData.propertyName,
      );
    }
    if (value) {
      GeoAnalyticsListResponse? geoAnalyticsListResponse =
          await MapplsGeoAnalyticsList(
            geoAnalyticsData.geoAnalyticsType.name.toLowerCase(),
            geoAnalyticsData.geoBoundType,
            geoAnalyticsData.geoBound,
            "b_box",
          ).callGeoAnalyticsList();
      if (geoAnalyticsListResponse != null) {
        handleResponse(geoAnalyticsListResponse);
      }
    }
  }

  void handleResponse(GeoAnalyticsListResponse geoAnalyticsListResponse) async {
    if (geoAnalyticsListResponse.results?.getAttrValues?.isNotEmpty == true) {
      geoAnalyticsListResponse.results?.getAttrValues?.forEach((value) {
        value.getAttrValues?.forEach((attrValue) {
          final bBox = attrValue["b_box"] as String?;
          final truncateBox = bBox?.substring(4, bBox.length - 1);
          List<LatLng> latLngList = [];
          if (truncateBox != null) {
            final parts = truncateBox.split(',');
            final start = parts[0].trim();
            final last = parts.length > 1 ? parts[1].trim() : null;

            final coords = start.split(' ');
            if (coords.length >= 2) {
              latLngList.add(
                LatLng(double.parse(coords[1]), double.parse(coords[0])),
              );
            }
            if(last != null) {
              final lastCoords = last.split(' ');
              if (lastCoords.length >= 2) {
                latLngList.add(
                  LatLng(double.parse(lastCoords[1]), double.parse(lastCoords[0])),
                );
              }
            }
          }
          mapController.animateCamera(CameraUpdate.newLatLngBounds(boundsFromLatLngList(latLngList)));
        });
      });
    }
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
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
}
