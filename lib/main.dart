import 'package:flutter/material.dart';
import 'package:mappls_flutter_sdk/map_demo.dart';
import 'package:mappls_flutter_sdk/samples/add_cluster.dart';
import 'package:mappls_flutter_sdk/samples/add_gradient_polyline.dart';
import 'package:mappls_flutter_sdk/samples/add_marker.dart';
import 'package:mappls_flutter_sdk/samples/add_polyline.dart';
import 'package:mappls_flutter_sdk/samples/autosuggest_widget.dart';
import 'package:mappls_flutter_sdk/samples/camera_feature.dart';
import 'package:mappls_flutter_sdk/samples/current_location.dart';
import 'package:mappls_flutter_sdk/samples/direction_ui_widget.dart';
import 'package:mappls_flutter_sdk/samples/direction_widget.dart';
import 'package:mappls_flutter_sdk/samples/geocode_widget.dart';
import 'package:mappls_flutter_sdk/samples/location_camera_option.dart';
import 'package:mappls_flutter_sdk/samples/map_click_event.dart';
import 'package:mappls_flutter_sdk/samples/map_long_click_event.dart';
import 'package:mappls_flutter_sdk/samples/map_style_event.dart';
import 'package:mappls_flutter_sdk/samples/marker_dragging.dart';
import 'package:mappls_flutter_sdk/samples/nearby_ui_widget.dart';
import 'package:mappls_flutter_sdk/samples/nearby_widget.dart';
import 'package:mappls_flutter_sdk/samples/place_detail_widget.dart';
import 'package:mappls_flutter_sdk/samples/place_picker_widget.dart';
import 'package:mappls_flutter_sdk/samples/place_search_widget.dart';
import 'package:mappls_flutter_sdk/samples/poi_along_route_widget.dart';
import 'package:mappls_flutter_sdk/samples/reverse_geocode_widget.dart';
import 'package:mappls_flutter_sdk/samples/tracking_widget.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mappls Flutter Demo',
      home: const MapsDemo(),
      routes: <String, WidgetBuilder>{
        '/MapClick': (BuildContext context) => const MapClickEvent(),
        '/MapLongClick': (BuildContext context) => const MapLongClickEvent(),
        '/MapStyle': (BuildContext context) => const MapStyleEvent(),
        '/CameraFeature': (BuildContext context) => const CameraFeature(),
        '/LocationCameraOptions': (BuildContext context) => const LocationCameraOption(),
        '/AddMarker': (BuildContext context) => const AddMarker(),
        '/MarkerDragging': (BuildContext context) => const MarkerDragging(),
        '/CurrentLocation': (BuildContext context) => const CurrentLocation(),
        '/AutoSuggest': (BuildContext context) => const AutosuggestWidget(),
        '/Geocode': (BuildContext context) => const GeocodeWidget(),
        '/ReverseGeocode': (BuildContext context) => const ReverseGeocodeWidget(),
        '/Nearby': (BuildContext context) => const NearbyWidget(),
        '/Direction': (BuildContext context) => const DirectionWidget(),
        '/POIAlongRoute': (BuildContext context) => const PoiAlongRouteWidget(),
        '/PlaceDetail': (BuildContext context) => const PlaceDetailWidget(),
        '/PlaceSearchUI': (BuildContext context) => const PlaceSearchWidget(),
        '/PlacePickerUI': (BuildContext context) => const PlacePickerWidget(),
        '/DirectionUI': (BuildContext context) => const DirectionUIWidget(),
        '/NearbyUI': (BuildContext context) => const NearbyUIWidget(),
        '/Tracking': (BuildContext context) => const TrackingWidget(),
        '/AddPolyline': (BuildContext context) => const AddPolyline(),
        '/GradientPolyline': (BuildContext context) => const AddGradientPolyline(),
        '/ClusterMarker': (BuildContext context) => const AddCluster(),
      },
    );
  }
}
