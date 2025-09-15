[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)
# Show Current Location
To display the user's current location on the map, your application must first request and obtain location permissions from the user.

## [Show/Hide Current Location On Map]()
Use this functionality to enable or disable the display of the user's current location on the map by controlling the visibility of the Location Component.
```dart
MapplsMap(    
  initialCameraPosition: _kInitialPosition,    
  myLocationEnabled: true,    
) 
```
## [Location Update Callback]()
To request continuous location update
```dart
MapplsMap(    
  initialCameraPosition: _kInitialPosition,    
  myLocationEnabled: true,    
  onUserLocationUpdated: (location) => {    
      print("Position: ${location.position.toString()}, Speed: ${location.speed}, Altitude: ${location.altitude}")    
}, ) 
```

## [Tracking Mode]()
Contains the variety of camera modes which determine how the camera will track the user location. 
```dart
MapplsMap(    
  initialCameraPosition: _kInitialPosition,    
  myLocationEnabled: true,    
  myLocationTrackingMode: MyLocationTrackingMode.none,    
) 
```
Following are the possible values for `MyLocationTrackingMode`:
1. `MyLocationTrackingMode.none`: No camera tracking.
2. `MyLocationTrackingMode.tracking`: Camera tracks the device location, no bearing is considered.
3. `MyLocationTrackingMode.trackingCompass`: Camera tracks the device location, tracking bearing provided by the device compass.
4. `MyLocationTrackingMode.trackingGps`: Camera tracks the device location, with bearing provided by a normalized `Location#getBearing()`.

>> Note: On Slide the Map or if we call any [Camera Controls Function](./Map-Camera.md) then the Tracking Mode is set to `MyLocationTrackingMode.none`


## [Render Mode]()
Contains the variety of ways the user location can be rendered on the map.
```dart
MapplsMap(
    initialCameraPosition: _kInitialPosition,
    myLocationEnabled: true,
    myLocationRenderMode: MyLocationRenderMode.normal,
)
```
Following are the possible values for `MyLocationRenderMode`:
1. `MyLocationRenderMode.normal`: This mode shows the device location, ignoring both compass and GPS bearing (no arrow rendered).
2. `MyLocationRenderMode.compass`: This mode shows the device location, as well as an arrow that is considering the compass of the device.
3. `MyLocationRenderMode.gps`: This mode shows the device location with the icon bearing updated from the `Location` updates being provided to the `LocationComponent`.

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
