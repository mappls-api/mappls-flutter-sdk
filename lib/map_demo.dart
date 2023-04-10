import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mappls_flutter_sdk/model/feature_list.dart';
import 'package:mappls_flutter_sdk/utils/color.dart';
import 'package:mappls_flutter_sdk/utils/feature_type.dart';
import 'package:mappls_gl/mappls_gl.dart';

final List<FeatureList> animationFeatures = <FeatureList>[
  const FeatureList('Tracking sample', 'To track a vehicle on map', '/Tracking')
];

final List<FeatureList> mapEvents = <FeatureList>[
  const FeatureList(
      "Map Tap", "Click on map and get Latitude Longitude", "/MapClick"),
  const FeatureList("Map Long Click",
      "Long press on map and get Latitude Longitude", "/MapLongClick"),
  const FeatureList("Map Styles",
      "To change and update Mappls Styles", "/MapStyle"),
];

final List<FeatureList> cameraFeatures = <FeatureList>[
  const FeatureList('Camera Features', "Animate, Move or Ease Camera Position",
      '/CameraFeature'),
  const FeatureList("Location Camera Options",
      "Location camera and render mode", '/LocationCameraOptions')
];

final List<FeatureList> markerFeatures = <FeatureList>[
  const FeatureList('Add Marker', 'Way to add Marker on Map', '/AddMarker'),
  const FeatureList('Marker Dragging', 'Drag a marker', '/MarkerDragging')
];

final List<FeatureList> locationFeatures = <FeatureList>[
  const FeatureList(
      'Current Location',
      'Location camera options for render and tracking modes',
      '/CurrentLocation')
];

final List<FeatureList> customWidgetFeature = <FeatureList>[
  const FeatureList(
      "Place Autocomplete Widget",
      "Location search functionality and UI to search a place",
      '/PlaceSearchUI'),
  const FeatureList(
      "Place Picker",
      "Place Picker to search and choose a specific location",
      '/PlacePickerUI'),
  const FeatureList('Direction Widget',
      "Mappls Direction Widget to show Route on map", '/DirectionUI'),
  const FeatureList('Nearby Widget',
      "Mappls Nearby Widget to search nearby result on map", '/NearbyUI')
];

final List<FeatureList> polylineFeatures = <FeatureList>[
  const FeatureList(
      'Draw Polyline',
      'Draw a polyline with given list of latitude and longitude',
      '/AddPolyline'),
  const FeatureList(
      'Polyline with Gradient color',
      'Draw a polyline with given list of latitude and longitude',
      '/GradientPolyline'),
  const FeatureList('Draw Polygon',
      'Draw a polygon with given list of latitude and longitude', '/AddPolygon')
];

final List<FeatureList> restApiFeatures = <FeatureList>[
  const FeatureList(
      'Autosuggest', 'Auto suggest places on the map', '/AutoSuggest'),
  const FeatureList('Geocode', 'Geocode rest API call', '/Geocode'),
  const FeatureList(
      'Reverse Geocode', 'Reverse Geocode rest API call', '/ReverseGeocode'),
  const FeatureList('Nearby', 'Show nearby results on the map', '/Nearby'),
  const FeatureList('Direction',
      'Get directions between two points and show on the map', '/Direction'),
  const FeatureList(
      'POI Along Route',
      'User will be able to get the details of POIs of a particular category along his set route',
      '/POIAlongRoute'),
  const FeatureList('Place Detail', 'To get the place details from mapplsPin',
      '/PlaceDetail'),
];

class MapsDemo extends StatefulWidget {
  const MapsDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapsDemoState();
  }
}

class _MapsDemoState extends State {
  FeatureType? selectedFeatureType;

  @override
  void initState() {
    super.initState();
    MapplsAccountManager.setMapSDKKey("");
    MapplsAccountManager.setRestAPIKey("");
    MapplsAccountManager.setAtlasClientId("");
    MapplsAccountManager.setAtlasClientSecret("");
    setState(() {
      selectedFeatureType = FeatureType.mapEvent;
    });
    setPermission();
  }


  void setPermission() async {
    if (!kIsWeb) {
      final location = Location();
      final hasPermissions = await location.hasPermission();
      if (hasPermissions != PermissionStatus.granted) {
        await location.requestPermission();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.colorPrimary,
          title: titleMap(),
        ),
        drawer: mapDrawer(),
        body: itemList(context));
  }

  Drawer mapDrawer() {
    return Drawer(
      child: ListView(
        padding:
            const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                MyColor.colorPrimary,
                MyColor.colorPrimaryDark,
                MyColor.colorAccent
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const <Widget>[
                SizedBox(
                  height: 110,
                ),
                Text(
                  "Mappls Flutter Sample",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Map Events'),
            onTap: () => {
              setState(() {
                selectedFeatureType = FeatureType.mapEvent;
              }),
              Navigator.pop(context)
            },
          ),
          ListTile(
            title: const Text('Camera'),
            onTap: () => {
              setState(() {
                selectedFeatureType = FeatureType.cameraFeature;
              }),
              Navigator.pop(context)
            },
          ),
          ListTile(
            title: const Text('Marker'),
            onTap: () => {
              setState(() {
                selectedFeatureType = FeatureType.markerFeature;
              }),
              Navigator.pop(context)
            },
          ),
          ListTile(
            title: const Text('Location'),
            onTap: () => {
              setState(() {
                selectedFeatureType = FeatureType.locationFeature;
              }),
              Navigator.pop(context)
            },
          ),
          ListTile(
            title: const Text('Rest Api Call'),
            onTap: () => {
              setState(() {
                selectedFeatureType = FeatureType.restApiCalls;
              }),
              Navigator.pop(context)
            },
          ),
          ListTile(
            title: const Text('Animations'),
            onTap: () => {
              setState(() {
                selectedFeatureType = FeatureType.animationFeature;
              }),
              Navigator.pop(context)
            },
          ),
          ListTile(
            title: const Text('Custom Widgets'),
            onTap: () => {
              setState(() {
                selectedFeatureType = FeatureType.customWidgetFeature;
              }),
              Navigator.pop(context)
            },
          ),
          ListTile(
            title: const Text('Polylines'),
            onTap: () => {
              setState(() {
                selectedFeatureType = FeatureType.polylineFeature;
              }),
              Navigator.pop(context)
            },
          )
        ],
      ),
    );
  }

  Widget itemList(BuildContext context) {
    if (selectedFeatureType == FeatureType.cameraFeature) {
      return ListView.builder(
          itemCount: cameraFeatures.length,
          itemBuilder: (_, int index) =>
              itemWidget(cameraFeatures[index], context));
    } else if (selectedFeatureType == FeatureType.markerFeature) {
      return ListView.builder(
          itemCount: markerFeatures.length,
          itemBuilder: (_, int index) =>
              itemWidget(markerFeatures[index], context));
    } else if (selectedFeatureType == FeatureType.locationFeature) {
      return ListView.builder(
          itemCount: locationFeatures.length,
          itemBuilder: (_, int index) =>
              itemWidget(locationFeatures[index], context));
    } else if (selectedFeatureType == FeatureType.restApiCalls) {
      return ListView.builder(
          itemCount: restApiFeatures.length,
          itemBuilder: (_, int index) =>
              itemWidget(restApiFeatures[index], context));
    } else if (selectedFeatureType == FeatureType.customWidgetFeature) {
      return ListView.builder(
          itemCount: customWidgetFeature.length,
          itemBuilder: (_, int index) =>
              itemWidget(customWidgetFeature[index], context));
    } else if (selectedFeatureType == FeatureType.polylineFeature) {
      return ListView.builder(
          itemCount: polylineFeatures.length,
          itemBuilder: (_, int index) =>
              itemWidget(polylineFeatures[index], context));
    } else if (selectedFeatureType == FeatureType.animationFeature) {
      return ListView.builder(
          itemCount: animationFeatures.length,
          itemBuilder: (_, int index) =>
              itemWidget(animationFeatures[index], context));
    } else {
      return ListView.builder(
          itemCount: mapEvents.length,
          itemBuilder: (_, int index) => itemWidget(mapEvents[index], context));
    }
  }

  titleMap() {
    if (selectedFeatureType == FeatureType.cameraFeature) {
      return const Text('Camera');
    } else if (selectedFeatureType == FeatureType.markerFeature) {
      return const Text('Marker');
    } else if (selectedFeatureType == FeatureType.locationFeature) {
      return const Text('Location');
    } else if (selectedFeatureType == FeatureType.restApiCalls) {
      return const Text('Rest Api Call');
    } else if (selectedFeatureType == FeatureType.customWidgetFeature) {
      return const Text('Custom Widgets');
    } else if (selectedFeatureType == FeatureType.polylineFeature) {
      return const Text('Polyline');
    } else if (selectedFeatureType == FeatureType.animationFeature) {
      return const Text('Animations');
    } else {
      return const Text('Map Events');
    }
  }

  Widget itemWidget(FeatureList featureList, BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 12,
          ),
          Text(
            featureList.featureTitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            featureList.featureDescription,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            height: 4,
            thickness: 2,
          )
        ],
      ),
      onTap: () => {Navigator.pushNamed(context, featureList.routeName)},
    );
  }
}
