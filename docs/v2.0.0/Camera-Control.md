[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)
# Camera Control
There are multiple ways to control the Camera Position in Mappls SDKs. Following are the methods tha you can use:

## [Move To Target]()
This method allows to move the camera towards the target location. 
```dart
controller.moveCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
```

## [Move To Target with Zoom]()
This method allows to move the camera towards the target location with a fixed zoom.
```dart
controller.moveCamera(CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), zoom));
```

## [Move To Bound]()
This method allows to move the camera towards the target location with view bounds.
```dart
const bounds = LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
controller.moveCamera(CameraUpdate.newLatLngBounds(bounds, top: 40, left: 40, bottom: 40, right: 40));
```

## [Zoom To]()
This method allows to zoom the camera to a particular zoom-level. Example, 18/14 etc.
```dart
controller.moveCamera(CameraUpdate.zoomTo(zoom));
```

## [Zoom By]()
This method allows to zoom the camera to a particular zoom by some amount of zoom level
```dart
controller.moveCamera(CameraUpdate.zoomBy(zoom));
```

## [Zoom In]()
This method allows to zoom in.
```dart
controller.moveCamera(CameraUpdate.zoomIn());
```

## [Zoom Out]()
This method allows to zoom out.
```dart
controller.moveCamera(CameraUpdate.zoomOut());
```

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