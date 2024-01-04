
[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)
# Mappls Direction Widget

A ready to use Fragment to show the Routes in an Android platform. It offers the following basic functionalities:

- Takes support of Mappls Place search for searching locations of origin, destinations and via points.
- It allows to use origin and destinations in Mappls digital address (semicolon separated) Mappls Pin or WGS 84 geographical coordinates both.
- The ability to set the vehicle profile like driving, and biking.
- Easily set the resource for traffic and ETA information.
  For more details, please contact apisupport@mappls.com.

## [Getting Started]()
To work with Mappls Direction Widget in flutter add these to your package's pubspec.yaml file:
~~~yaml
dependencies:
	mappls_direction_plugin: ^1.0.0
~~~

Now in your dart code you need to import this package:
~~~dart
import 'package:mappls_direction_plugin/mappls_direction_plugin.dart';
~~~


## [Adding Mappls Keys]()

You **must** provide your keys through the `MapplsAccountManager` class.([click here](./Getting-Started.md#add-your-api-keys-to-the-sdk))

## [Add Direction Widget]()

Use method `openDirectionWidget` to open Direction Widget:
~~~dart
// Platform messages may fail, so we use a try/catch PlatformException.
try {

DirectionCallbcak directionCallback = await openDirectionWidget(directionOptions:options );
} on PlatformException {

}
~~~
You can use `DirectionOptions` to set the properties of the widget:
1.  `resource(String)`:  **Below are the available resource:**
    -   DirectionsCriteria.RESOURCE_ROUTE  **(Default)**: to calculate a route & its duration without considering traffic conditions.
    -   DirectionsCriteria.RESOURCE_ROUTE_ETA get the updated duration of a route considering live traffic; Applicable for India only "region=ind" and "rtype=1" is not supported. This is different from route_traffic; since this doesn't search for a route considering traffic, it only applies delays to the default route.
    -   DirectionsCriteria.RESOURCE_ROUTE_TRAFFIC:
        to search for routes considering live traffic; Applicable for India only “region=ind” and “rtype=1” is not supported
2.  `showAlternative(Boolean)`: Show alternative routes.
3.  `profile(String)`:  **Below are the available profile:**
    -   DirectionsCriteria.PROFILE_DRIVING  **(Default)**:Meant for car routing
    -   DirectionsCriteria.PROFILE_WALKING: Meant for pedestrian routing. Routing with this profile is restricted to route_adv only. region & rtype request parameters are not supported in pedestrian routing
    -   DirectionsCriteria.PROFILE_BIKING:Meant for two-wheeler routing. Routing with this profile is restricted to route_adv only. region & rtype request parameters are not supported in two-wheeler routing.
    -   DirectionsCriteria.PROFILE_TRUCKING:Meant for Truck routing. Routing with this profile is restricted to route_adv only. region & rtype request parameters are not supported in truck routing.
4.  `overview(String)`: Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all.  **Below are the available value:**
    -   DirectionsCriteria.OVERVIEW_FULL
    -   DirectionsCriteria.OVERVIEW_FALSE
    -   DirectionsCriteria.OVERVIEW_SIMPLIFIED
5.  `steps(Boolean)`: Return route steps for each route leg. Possible values are true/false. By default it will be used as false.
6.  `excludes(List<String>)`  : Additive list of road classes to avoid, order does not matter.  **Below are the available value:**
    -   DirectionsCriteria.EXCLUDE_FERRY
    -   DirectionsCriteria.EXCLUDE_MOTORWAY
    -   DirectionsCriteria.EXCLUDE_TOLL
7.  `showStartNavigation(Boolean)`: To show the Start Navigation button if the origin is current location.
8.  `destination(DirectionPoint)`: You can use  `DirectionPoint`  to pass the destination in direction widget:
    -   `location(LatLng)`: Latitude and longitude of destination
    -   `mapplsPin(String)`: It takes mappls pin
    - `placeName(String)`: It takes the place name
    -  `placeAddress(String)`: It takes the address
9. `searchPlaceOption(PlaceOptions`): To set the properties of search widget


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