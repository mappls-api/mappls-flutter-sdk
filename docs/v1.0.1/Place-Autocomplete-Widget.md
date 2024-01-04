
[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)

# Mappls Search Widget

Mappls Search Widget contains Place Autocomplete and Place Picker

## [Getting Started]()
To work with Mappls Search Widget in flutter add these to your package's pubspec.yaml file:
~~~yaml  
dependencies:  
	mappls_place_widget: ^1.0.1
~~~  

Now in your dart code you need to import this package:
~~~dart  
import 'package:mappls_place_widget/mappls_place_widget.dart'; 
~~~  



## [Adding Mappls Keys]()

You **must** provide your keys through the `MapplsAccountManager` class.([click here](./Getting-Started.md#add-your-api-keys-to-the-sdk))

## [Place Autocomplete]()

Use method `openPlaceAutocomplete` to open Place Autocomplete Widget:
~~~dart
// Platform messages may fail, so we use a try/catch PlatformException.  
try {  
  
  ELocation eLocation = await openPlaceAutocomplete(PlaceOptions(enableTextSearch: true,hint: "search Location"));  
  print(json.encode(eLocation.toJson()));  
} on PlatformException {  
    
}
~~~
You can use `PlaceOptions` to set the properties of the widget:
1. `filter(String)`: this parameter helps you restrict the result either by mentioning a bounded area or to certain mappls pin (6 digit code to any poi, locality, city, etc.), below mentioned are the both types:

    -   `filter`  = bounds: lat1, lng1; lat2, lng2 (latitude, longitude) {e.g. filter: "bounds: 28.598882, 77.212407; 28.467375, 77.353513"}
    -   `filter`  = cop: {mapplsPin} (string) {e.g. filter: "cop:YMCZ0J"}
2. `hint(String)`: To set the hint on the Search view of the widget.
3. `historyCount(int)`: Maximum number of history results appear
4. `pod(String)`: it takes in the place type code which helps in restricting the results to certain chosen type. **Below mentioned are the codes for the pod**:
    - AutoSuggestCriteria.POD_SUB_LOCALITY
    - AutoSuggestCriteria.POD_LOCALITY
    - AutoSuggestCriteria.POD_CITY
    - AutoSuggestCriteria.POD_VILLAGE
    - AutoSuggestCriteria.POD_SUB_DISTRICT
    - AutoSuggestCriteria.POD_DISTRICT
    - AutoSuggestCriteria.POD_STATE
    - AutoSuggestCriteria.POD_SUB_SUB_LOCALITY
5. `backgroundColor(String)`: Background color of search widget
6. `toolbarColor(String)`: to set the toolbar color of the widget.
7. `saveHistory(bool)`: If it sets to  `true`  it shows the history selected data
8. `tokenizeAddress(bool)`: provides the different address attributes in a structured object.
9. `zoom(double)`: takes the zoom level of the current scope of the map (min: 4, max: 18).
10. `location(LatLng)`:  set location around which your search will appear
11.    `attributionHorizontalAlignment(int)`: To set the vertical alignment for attribution.  **Below mentioned are the values:**
    -   PlaceOptions.GRAVITY_LEFT
    -   PlaceOptions.GRAVITY_CENTER
    -   PlaceOptions.GRAVITY_RIGHT
12. `attributionVerticalAlignment(int)`: To set the horizontal alignment for attribution.  **Below mentioned are the values:**
    -   PlaceOptions.GRAVITY_TOP
    -   PlaceOptions.GRAVITY_BOTTOM
13. `logoSize(int)`: To set the logo size.  **Below mentioned are the values:**
    -   PlaceOptions.SIZE_SMALL
    -   PlaceOptions.SIZE_MEDIUM
    -   PlaceOptions.SIZE_LARGE
14. `debounce(int)`: This means that the the search apis is hit only debounce value. This is made to control the api hits from SDK parameter. It takes values in milliseconds. Minimum value is 0 and Maximum value is 1500.

## [Place Picker]()
Use method `openPlacePicker` to open Place Picker:
~~~dart
try {   
  Place place = await openPlacePicker(PickerOption(includeSearch: true));  
  print(json.encode(place.toJson()));  
} on PlatformException {  
 
}
~~~
You can use `PickerOption` to set the properties of the widget:
1. `includeDeviceLocationButton(bool)`: To enable/ disable current location functionality
2. `includeSearch(bool)`: To provide opions for search locations
3. `mapMaxZoom(double)`: To set maximum zoom level of the map
4. `mapMinZoom(double)`: To set minimum zoom level of the map
5. `placeOptions(PlaceOptions)`: To set all the properties of search widget​
6.  `toolbarColor(String)`: To set the toolbar color of place widget
7. `marker(Uint8List)`:  To change the marker image which is visible in the centre of a map
8.  `statingCameraPosition(CameraPosition)`: To open a map that sets in camera poition you can set zoom, centre, bearing etc.,
9. `startingBounds(LatLngBounds)`: To open a map in a bound


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




<div align="center">@ Copyright 2023 CE Info Systems Ltd. All Rights Reserved.</div>      

<div align="center"> <a href="https://about.mappls.com/api/terms-&-conditions">Terms & Conditions</a> | <a href="https://about.mappls.com/about/privacy-policy">Privacy Policy</a> | <a href="https://about.mappls.com/pdf/mapmyIndia-sustainability-policy-healt-labour-rules-supplir-sustainability.pdf">Supplier Sustainability Policy</a> | <a href="https://about.mappls.com/pdf/Health-Safety-Management.pdf">Health & Safety Policy</a> | <a href="https://about.mappls.com/pdf/Environment-Sustainability-Policy-CSR-Report.pdf">Environmental Policy & CSR Report</a>      

<div align="center">Customer Care: +91-9999333223</div>