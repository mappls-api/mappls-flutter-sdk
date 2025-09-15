[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)
# Map Camera
The Mappls Maps SDK camera represents the user’s viewpoint over the map. It provides flexible options to set, update, and animate the camera position, as well as listen for camera movement events and retrieve the current camera state at any time.

## [Camera position]()
The Mappls Maps SDK for Flutter gives you full control over the map camera's position and behavior, enabling you to create highly customized and interactive map experiences. The camera is defined by several key properties:

- `target`: The geographic coordinates (latitude and longitude) that the camera focuses on.

- `bearing`: The map’s rotation, representing the direction the camera is facing. A bearing of 0° points north, while increasing values rotate the map clockwise to indicate a different orientation.

- `tilt`: The angle between the camera and the ground plane. A tilt of 0° provides a top-down view, while higher values (e.g., 60°) offer a more angled, horizon-facing perspective.

- `zoom`: Controls how close the camera is to the map content. Lower zoom levels (e.g., 1) show large areas like continents, mid-range values (e.g., 11) show city-level detail, and higher zoom levels reveal streets, buildings, and points of interest.

## [Set Camera Position On Map]()
- Using initial Camera on map:
```dart
static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(25.321684, 82.987289),
    zoom: 10.0,
  );

MapplsMap(
        initialCameraPosition: _kInitialPosition,
)
```

- Using `moveCamera` or `animateCamera` or `easeCamera`
```dart
const cameraPosition = CameraPosition(
  target: LatLng(25.321684, 82.987289),
  zoom: 10.0,
);
controller.moveCamera(CameraUpdate.newCameraPosition(cameraPosition));
```

## [Camera Animations]()
Mappls Map's SDK support three types of Animations:
- Move Camera
- Ease Camera
- Animate Camera

### [Move Camera]()
This method immediately updates the map to the specified CameraPosition without applying any transition or animation:
```dart
controller.moveCamera(CameraUpdate.newCameraPosition(cameraPosition));
```

### [Ease Camera]()
This method transitions the map to the provided CameraPosition with a grounded animation, offering a smooth and immersive camera movement experience.
```dart
controller.easeCamera(CameraUpdate.newCameraPosition(cameraPosition));
```

### [Animate Camera]()
This method transitions the map to the specified CameraPosition with a flight animation, simulating a smooth, high-altitude movement for a more dynamic visual experience.
```dart
controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
```
Map SDK support : More Controls on Camera [Here](./Camera-Control.md)

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




<div align="center">@ Copyright 2025 CE Info Systems Ltd. All Rights Reserved.</div>    

<div align="center"> <a href="https://about.mappls.com/api/terms-&-conditions">Terms & Conditions</a> | <a href="https://about.mappls.com/about/privacy-policy">Privacy Policy</a> | <a href="https://about.mappls.com/pdf/mapmyIndia-sustainability-policy-healt-labour-rules-supplir-sustainability.pdf">Supplier Sustainability Policy</a> | <a href="https://about.mappls.com/pdf/Health-Safety-Management.pdf">Health & Safety Policy</a> | <a href="https://about.mappls.com/pdf/Environment-Sustainability-Policy-CSR-Report.pdf">Environmental Policy & CSR Report</a>    

<div align="center">Customer Care: +91-9999333223</div>