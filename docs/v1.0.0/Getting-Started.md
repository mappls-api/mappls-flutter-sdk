[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)

# Mappls Vector Map Flutter SDK

**Easy To Integrate Maps & Location APIs & SDKs For Web & Mobile Applications**

Powered with India's most comprehensive and robust mapping functionalities.

1. You can get your api key to be used in this document here: [https://apis.mappls.com/console/](https://apis.mappls.com/console/)

2. The sample code is provided to help you understand the basic functionality of Mappls maps & REST APIs working on **Flutter** development platform.

3. Explore through [200 + nations with Global Search](https://github.com/mappls-api/mappls-rest-apis/blob/main/docs/countryISO.md) with **Global Search, Routing and Mapping APIs & SDKs** by Mappls.

## [Getting Started]()
Mappls Maps SDK for Flutter lets you easily add Mappls Maps and web services to your own Flutter application. The SDK for Android supports API **16+** and for IOS supports **10.0+**. You can have a look at the map and features you will get in your own app by using the Mappls Maps SDK for Flutter.

Through customized tiles, you can add different map layers to your application and add bunch of controls and gestures to enhance map usability thus creating potent map based solutions for your customers. The SDK handles downloading of map tiles and their display along with a bunch of controls and native gestures.

## [API Usage]()

Your Mappls Maps SDK usage needs a set of license keys (get them  [here](https://apis.mappls.com/console/)) and is governed by the API  [terms and conditions](https://about.mappls.com/api/terms-&-conditions). As part of the terms and conditions,  **you cannot remove or hide the Mappls logo and copyright information** in your project.

The allowed SDK hits are described on the user [dashboard](https://apis.mappls.com/console) page. Note that your usage is shared between platforms, so the API hits you make from a web application, Android app or an iOS app all add up to your allowed daily limit.

## [Installation]()
To work with Mappls Map in flutter add this to your package's pubspec.yaml file:
~~~yaml
dependencies:  
	mappls_gl: ^1.0.0
~~~
Now in your dart code you need to import this package:
~~~dart
import 'package:mapmyindia_gl/mapmyindia_gl.dart';
~~~

## [Add Your API keys to the SDK]()
~~~dart
MapplsAccountManager.setMapSDKKey(MAP_SDK_KEY); 
MapplsAccountManager.setRestAPIKey(REST_API_KEY);
MapplsAccountManager.setAtlasClientId(ATLAS_CLIENT_ID); 
MapplsAccountManager.setAtlasClientSecret(ATLAS_CLIENT_SECRET); 
~~~

## [Add Mappls Map to your application]()
Add MapplsMap widget
~~~dart
MapplsMap(  
  initialCameraPosition: CameraPosition(  
	  target: LatLng(28.551087, 77.257373),  
	  zoom: 14.0,  
	),  
  onMapCreated: (mapController) => {  
	  mapplsMapController = mapController
  },  
)
~~~

## [Map Interactions]()
The Mappls Maps Flutter SDK allows you to define interactions that you can activate on the map to enable gestures and click events. The following interactions are supported –

### [Zoom Controls]()
The map supports the familiar two-finger pinch and zooms to change zoom level as well as double tap to zoom in. Set zoom to 4 for country level display and 18 for house number display. In this SDK the camera position plays an important role

And following operations can be performed using the CameraPosition

### [Target]()
The target is single latitude and longitude coordinate that the camera centers it on. Changing the camera's target will move the camera to the inputted coordinates. The target is a LatLng object. The target coordinate is always _at the center of the viewport_.

### [Tilt]()
Tilt is the camera's angle from the nadir (directly facing the Earth) and uses unit degrees. The camera's minimum (default) tilt is 0 degrees, and the maximum tilt is 60. Tilt levels use six decimal point of precision, which enables you to restrict/set/lock a map's bearing with extreme precision.

The map camera tilt can also adjust by placing two fingertips on the map and moving both fingers up and down in parallel at the same time

### [Bearing]()
Bearing represents the direction that the camera is pointing in and measured in degrees  _clockwise from north_.

The camera's default bearing is 0 degrees (i.e. "true north") causing the map compass to hide until the camera bearing becomes a non-zero value. Bearing levels use six decimal point precision, which enables you to restrict/set/lock a map's bearing with extreme precision. In addition to programmatically adjusting the camera bearing, the user can place two fingertips on the map and rotate their fingers.

### [Zoom]()
Zoom controls scale of the map and consumes any value between 0 and 22. At zoom level 0, viewport shows continents and other world features. A middle value of 11 will show city level details.At a higher zoom level, map will begin to show buildings and points of interest. Camera can zoom in following ways:

-   Pinch motion two fingers to zoom in and out.
-   Quickly tap twice on the map with a single finger to zoom in.
-   Quickly tap twice on the map with a single finger and hold your finger down on the screen after the second tap.
-   Then slide the finger up to zoom out and down to zoom out.

##### Sdk allows various method to Move,  ease, animate Camera to a particular location :
~~~dart
mapController.moveCamera(CameraUpdate.newLatLngZoom(LatLng(22.553147478403194, 77.23388671875), 14));  
mapController.easeCamera(CameraUpdate.newLatLngZoom(LatLng(28.704268, 77.103045), 14));  
mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(28.698791, 77.121243), 14));  
~~~

## [Map Events]()
##### It sets a callback that is invoked when camera movement has ended.
~~~dart
MapplsMap(  
  initialCameraPosition: _kInitialPosition,  
  onCameraIdle: () => {  
      
  }, 
)
~~~
### [Map Click/Long click]()
If you want to respond to a user tapping on a point on the map, you can use a onMapClick callback.

It sets a callback that's invoked when the user clicks on the map:
~~~dart
MapplsMap(  
  initialCameraPosition: _kInitialPosition,  
  onMapClick: (point, latlng) => {  
    Fluttertoast.showToast(msg: latlng.toString())  
  },  
)
~~~
##### Sets a callback that's invoked when the user long clicks on the map view.
~~~dart
MapplsMap(  
  initialCameraPosition: _kInitialPosition,  
  onMapLongClick: (point, latLng) => {  
    Fluttertoast.showToast(msg: latLng.toString())  
  },  
)
~~~

## [Map Overlays]()
### [Add a Marker]()
Add marker on the map by following these steps:
~~~dart
Symbol symbol = await controller.addSymbol(SymbolOptions(geometry: LatLng(25.321684, 82.987289)));
~~~

### [Remove a Marker]()
To remove a marker from map
~~~dart
controller.removeSymbol(symbol);
~~~

### [Customize a marker]()
~~~dart
/// Adds an asset image to the currently displayed style  
Future<void> addImageFromAsset(String name, String assetName) async {  
  final ByteData bytes = await rootBundle.load(assetName);  
 final Uint8List list = bytes.buffer.asUint8List();  
 return controller.addImage(name, list);  
}

await addImageFromAsset("icon", "assets/symbols/custom-icon.png");
Symbol symbol = await controller.addSymbol(SymbolOptions(geometry: LatLng(25.321684, 82.987289), iconImage: "icon"));
~~~

### [Add a Polyline]()
Draw a polyline on Map
~~~dart
Line line = await controller.addLine(LineOptions(geometry: latlng, lineColor: "#3bb2d0", lineWidth: 4));
~~~

### [Remove a Polyline]()
To remove polyline from Map
~~~dart
controller.removeLine(line);
~~~

### [Add a Polygon]()
Draw a polygon on the map:
~~~dart
Fill fill = await controller.addFill(FillOptions(geometry: latlng, fillColor: "#3bb2d0"));
~~~

### [Remove a Polygon]()
~~~dart
controller.removeFill(fill);
~~~

## [Show User location]()
To show user current location on the map
~~~dart
MapplsMap(    
  initialCameraPosition: _kInitialPosition,    
  myLocationEnabled: true,    
  myLocationTrackingMode: MyLocationTrackingMode.NONE_COMPASS,    
  onUserLocationUpdated: (location) => {    
      print("Position: ${location.position.toString()}, Speed: ${location.speed}, Altitude: ${location.altitude}")    
}, )  
~~~

<br><br><br>


For any queries and support, please contact: 

[<img src="https://about.mappls.com/images/mappls-logo.svg" height="40"/> </p>](https://about.mappls.com/api/)
Email us at [apisupport@mappls.com](mailto:apisupport@mappls.com)


![](https://www.mapmyindia.com/api/img/icons/support.png)
[Support](https://about.mappls.com/contact/)
Need support? contact us!

<br></br>
<br></br>

[<p align="center"> <img src="https://www.mapmyindia.com/api/img/icons/stack-overflow.png"/> ](https://stackoverflow.com/questions/tagged/mappls-api)[![](https://www.mapmyindia.com/api/img/icons/blog.png)](https://about.mappls.com/blog/)[![](https://www.mapmyindia.com/api/img/icons/gethub.png)](https://github.com/Mappls-api)[<img src="https://mmi-api-team.s3.ap-south-1.amazonaws.com/API-Team/npm-logo.one-third%5B1%5D.png" height="40"/> </p>](https://www.npmjs.com/org/mapmyindia) 



[<p align="center"> <img src="https://www.mapmyindia.com/june-newsletter/icon4.png"/> ](https://www.facebook.com/Mapplsofficial)[![](https://www.mapmyindia.com/june-newsletter/icon2.png)](https://twitter.com/mappls)[![](https://www.mapmyindia.com/newsletter/2017/aug/llinkedin.png)](https://www.linkedin.com/company/mappls/)[![](https://www.mapmyindia.com/june-newsletter/icon3.png)](https://www.youtube.com/channel/UCAWvWsh-dZLLeUU7_J9HiOA)




<div align="center">@ Copyright 2022 CE Info Systems Ltd. All Rights Reserved.</div>

<div align="center"> <a href="https://about.mappls.com/api/terms-&-conditions">Terms & Conditions</a> | <a href="https://about.mappls.com/about/privacy-policy">Privacy Policy</a> | <a href="https://about.mappls.com/pdf/mapmyIndia-sustainability-policy-healt-labour-rules-supplir-sustainability.pdf">Supplier Sustainability Policy</a> | <a href="https://about.mappls.com/pdf/Health-Safety-Management.pdf">Health & Safety Policy</a> | <a href="https://about.mappls.com/pdf/Environment-Sustainability-Policy-CSR-Report.pdf">Environmental Policy & CSR Report</a>

<div align="center">Customer Care: +91-9999333223</div>