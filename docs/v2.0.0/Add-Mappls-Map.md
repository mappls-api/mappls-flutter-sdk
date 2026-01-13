[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)
# Mappls Map SDK
Mappls Map SDK is a powerful and versatile software development kit that enables developers to seamlessly integrate rich, interactive mapping and location-based services into their mobile and web applications. With comprehensive support for detailed maps, routing, geocoding, real-time traffic updates, and advanced spatial analytics, the SDK empowers businesses to create intuitive navigation experiences and location-aware solutions. Its customizable UI components, efficient performance, and extensive API set make it ideal for building applications across various industries including logistics, transportation, travel, and urban planning.

## [Version History]()

| Version | Last Updated | Author | Release Note                                                                                                                                                                                                                                     | 
|---------|--------------| ---- |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| v2.0.3  | 13 Jan, 2026 | Mappls API Team ([MA](https://github.com/mdakram)) ([ST](https://github.com/saksham66)) | - Bug Fixes and Improvement                                                                                                                                                                                                                      |
| v2.0.2  | 31 Dec, 2025 | Mappls API Team ([MA](https://github.com/mdakram)) ([ST](https://github.com/saksham66)) | - Bug Fixes and Improvement                                                                                                                                                                                                                      |
| v2.0.1  | 17 Oct, 2025 | Mappls API Team ([MA](https://github.com/mdakram)) ([ST](https://github.com/saksham66)) | - Bug Fixes and Improvement                                                                                                                                                                                                                      |
| v2.0.0  | 15 Sep, 2025 | Mappls API Team ([MA](https://github.com/mdakram)) ([ST](https://github.com/saksham66)) | - Authentication and authorization mechanisms have been revised. </br> - Updated minimum Android version to 21. </br> - Added Support for 16 KB Page Sizes in Android </br> - Added SPM(Swift Package Manager in IOS) </br> - Initial Web Support |

For more details of previous versions , [click here](./Version-History.md).

## Import Flutter Map
In your dart code you need to import this package:
```dart
import 'package:mappls_gl/mappls_gl.dart';
```

## Add Flutter Mappls Map
To add Mappls Map to your flutter Application:
```dart
MapplsMap(  
  initialCameraPosition: CameraPosition(  
	  target: LatLng(28.551087, 77.257373),  
	  zoom: 14.0,  
	),  
  onMapCreated: (mapController) => {  
	  mapplsMapController = mapController
  },  
)
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




<div align="center">@ Copyright 2026 CE Info Systems Ltd. All Rights Reserved.</div>

<div align="center"> <a href="https://about.mappls.com/api/terms-&-conditions">Terms & Conditions</a> | <a href="https://about.mappls.com/about/privacy-policy">Privacy Policy</a> | <a href="https://about.mappls.com/pdf/mapmyIndia-sustainability-policy-healt-labour-rules-supplir-sustainability.pdf">Supplier Sustainability Policy</a> | <a href="https://about.mappls.com/pdf/Health-Safety-Management.pdf">Health & Safety Policy</a> | <a href="https://about.mappls.com/pdf/Environment-Sustainability-Policy-CSR-Report.pdf">Environmental Policy & CSR Report</a>

<div align="center">Customer Care: +91-9999333223</div>
