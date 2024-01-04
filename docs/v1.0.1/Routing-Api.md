
[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)


# Routes & Navigation API

## [Routing API]()

Routing and displaying driving directions on map, including instructions for navigation, distance to destination, traffic etc. are few of the most important parts of developing a map based application. This REST API calculates driving routes between specified locations including via points based on route type(fastest or shortest), includes delays for traffic congestion , and is capable of handling additional route parameters like: type of roads to avoid, travelling vehicle type etc.
~~~dart
try {  
  DirectionResponse? directionResponse = await MapplsDirection(origin: LatLng(28.594475, 77.202432),destination: LatLng(28.554676, 77.186982)).callDirection();
} catch(e) {  
  PlatformException map = e as PlatformException;  
  print(map.code);  
}

					//OR
MapplsDirection(origin: LatLng(28.594475, 77.202432),destination: LatLng(28.554676, 77.186982)).callDirection().then((response) {  
  //Handle response 
},onError: (e) {  
  print(e.code);  
}).onError((error, stackTrace) => {});
~~~
### Request Parameters

#### Mandatory Parameter

1.  `origin(LatLng)`: pass the origin point
    -   origin can also takes mapplsPin in parameter eg.,  `originMapplsPin("17ZUL7")`
2.  `destination(LatLng)`: pass the destination point
    -   destination can also takes mapplsPin in parameter eg.,  `destinationMapplsPin("MMI000")`

#### Optional Parameter

1.  `profile(String)`:  Below are the available profile:
    -   DirectionsCriteria.PROFILE_DRIVING is *Default* :Meant for car routing
    -   DirectionsCriteria.PROFILE_WALKING: Meant for pedestrian routing. Routing with this profile is restricted to route_adv only. region & rtype request parameters are not supported in pedestrian routing
    -   DirectionsCriteria.PROFILE_BIKING:Meant for two-wheeler routing. Routing with this profile is restricted to route_adv only. region & rtype request parameters are not supported in two-wheeler routing.
    -   DirectionsCriteria.PROFILE_TRUCKING:Meant for Truck routing. Routing with this profile is restricted to route_adv only. region & rtype request parameters are not supported in truck routing.
2.  `resource(String)`:  Below are the available resource:
    -   DirectionsCriteria.RESOURCE_ROUTE is *Default*: to calculate a route & its duration without considering traffic conditions.
    -   DirectionsCriteria.RESOURCE_ROUTE_ETA get the updated duration of a route considering live traffic; Applicable for India only "region=ind" and "rtype=1" is not supported. This is different from route_traffic; since this doesn't search for a route considering traffic, it only applies delays to the default route.
    -   DirectionsCriteria.RESOURCE_ROUTE_TRAFFIC:  
        to search for routes considering live traffic; Applicable for India only “region=ind” and “rtype=1” is not supported
3.  `steps(bool)`:Return route steps for each route leg. Possible values are true/false. By default it will be used as false.
4.  `overview(String)`: Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all. Below are the available value:
    -   DirectionsCriteria.OVERVIEW_FULL
    -   DirectionsCriteria.OVERVIEW_FALSE
    -   DirectionsCriteria.OVERVIEW_SIMPLIFIED
5.  `excludes(List<String>)`: Additive list of road classes to avoid, order does not matter.  Below are the available value:   -   DirectionsCriteria.EXCLUDE_FERRY
    -   DirectionsCriteria.EXCLUDE_MOTORWAY
    -   DirectionsCriteria.EXCLUDE_TOLL
6.  `waypoint(List<LatLng>)`: pass single waypoint at a time
    -   waypoint also takes mapplsPin in parameter eg.,  `waypointMapplsPin(["MMI000"])`
7.  `alternatives(bool)`: Search for alternative routes.
8.  `radiuses(List<double>)`: Limits the search to given radius in meters. For all way-points including start and end points.
9.  `geometries(String)`: This parameter used to change the route geometry format/density (influences overview and per step).Below are the available value:
    -   DirectionsCriteria.GEOMETRY_POLYLINE: with 5 digit precision
    -   DirectionsCriteria.GEOMETRY_POLYLINE6 *(Default)*: with 6 digit precision
### Response Parameters

1.  `code`  (String): if request is successful, response is .ok.. Else, see the service dependent and general status codes. In case of error, .NoRoute. code is supported (in addition to the general ones) which means .no route found..
2.  `routes`(List`<DirectionsRoute>`): A list of DirectionsRoute objects, each having potentially multiple via points
3.  `waypoints`(List`<DirectionsWaypoint>`): Array of DirectionsWaypoint objects representing all waypoints in order

#### DirectionsRoute Response result parameters:

1.  `distance` (double): The distance travelled by the route; unit is meter.
2.  `duration` (double): The estimated travel time; unit is second.
3.  `geometry`  (String): returns the whole geometry of the route as per given parameter .geometries. default is encoded .polyline6. with 6 digit accuracy for positional coordinates.
4.  `legs` (List`<RouteLeg>`): The legs between the given waypoints, representing an array of RouteLeg between two waypoints.

##### Route Leg result parameters:

1.  `distance`(double): The distance of travel to the subsequent legs, in meters
2.  `duration` (double): The estimated travel time, in seconds
3.  `steps` (List`<LegStep>`): Return route steps for each route leg depending upon steps parameter.

##### LegStep result parameters:

1.  `distance` (double) :The distance of travel to the subsequent step, in meters
2.  `duration`  (double): The estimated travel time, in seconds
3.  `geometry`  (double): The un-simplified geometry of the route segment, depends on the given geometries parameter.
4.  `name` (String): The name of the way along which travel proceeds.
5.  `mode` (String): signifies the mode of transportation; driving as default.
6.  `maneuver`(StepManeuver): A StepManeuver object representing a maneuver
7.  `drivingSide`(String): .Left. (default) for India, Sri Lanka, Nepal, Bangladesh & Bhutan.
8.  `intersections`(List`<StepIntersection>`): A list of StepIntersection objects that are passed along the segment, the very first belonging to the StepManeuver

##### StepManeuver result parameters:

1.  `location`(LatLng): A Point describing the location of the turn
2.  `bearingBefore `(double): The clockwise angle from true north to the direction of travel immediately before the maneuver.
3.  `bearingAfter`(double): The clockwise angle from true north to the direction of travel immediately after the maneuver.
4.  `type`(String): An optional string indicating the direction change of the maneuver.
5.  `modifier`(String): A string indicating the type of maneuver. New identifiers might be introduced without API change. Types unknown to the client should be handled like the .turn. type, the existence of correct modifier values is guaranteed.

##### StepIntersection result parameters:

1.  `location` (LatLng): point describing the location of the turn.
2.  `bearings`(List`<Integer>`): A list of bearing values (e.g. [0,90,180,270]) thxat are available at the intersection. The bearings describe all available roads at the intersection.
3.  `classes`(List`<String>`): Categorised types of road segments e.g. Motorway
4.  `entry` (List`<Boolean>`): A list of entry flags, corresponding in a 1:1 relationship to the bearings. A value of true indicates that the respective road could be entered on a valid route. false indicates that the turn onto the respective road would violate a restriction.
5.  `in` (Integer): index into bearings/entry array. Used to calculate the bearing just before the turn. Namely, the clockwise angle from true north to the direction of travel immediately before the maneuver/passing the intersection. Bearings are given relative to the intersection. To get the bearing in the direction of driving, the bearing has to be rotated by a value of 180. The value is not supplied for depart maneuvers.
6.  `out`  (Integer): index into the bearings/entry array. Used to extract the bearing just after the turn. Namely, The clockwise angle from true north to the direction of travel immediately after the maneuver/passing the intersection. The value is not supplied for arrive maneuvers.
7.  `lanes`  (List`<IntersectionLanes>`Array of IntersectionLanes objects that denote the available turn lanes at the intersection. If no lane information is available for an intersection, the lanes property will not be present.):
    -  `valid`(bool): verifying lane info.
    -  `indications`  (List`<String>`): Indicating a sign of directions like Straight, Slight Left, Right, etc.

#### DirectionsWaypoint Response result parameters:

1.  `name` (String): Name of the street the coordinate snapped to.
2.  `location` (LatLng): Point describing the snapped location of the waypoint.

## [Driving Distance Matrix API]()

Adding driving directions API would help to add predicted travel time & duration from a given origin point to a number of points. The Driving Distance Matrix API provides driving distance and estimated time to go from a start point to multiple destination points, based on recommended routes from Mappls Maps and traffic flow conditions

Get driving time and distance between a center point and up to 10 destination points using Mappls Maps  Distance API
~~~dart
try {  
 DistanceResponse? response = await MapplsDistanceMatrix(sources: ["77.89,28.777"], destinations: ["MMI000"]).callDistanceMatrix();
} catch(e) {  
  PlatformException map = e as PlatformException;  
  print(map.code);  
}

					//OR
MapplsDistanceMatrix(sources: ["77.89,28.777"], destinations: ["MMI000"]).callDistanceMatrix().then((response) {  
  //Handle response 
},onError: (e) {  
  print(e.code);  
}).onError((error, stackTrace) => {});
~~~
### Request Parameter

#### Manadatory Parameter

1.  `sources(List<String>)`: A List full of sources.
2.  `destinations(List<String>)`:  A full list of destinations

#### Optional Parameter

1.  `profile(String)`  :  Only supports  DistanceCriteria.PROFILE_DRIVING.
2.  `resource(Strng)`:  Below are the available value:
    -   DistanceCriteria.RESOURCE_DISTANCE  *Default*: to calculate the route & duration without considering traffic conditions.
    -   DistanceCriteria.RESOURCE_DISTANCE_ETA: to get the updated duration considering live traffic; Applicable for India only “region=ind” and “rtype=1” is not supported. This is different from distance_matrix_traffic; since this doesn't search for a route considering traffic, it only applies delays to the default route.
    -   DistanceCriteria.RESOURCE_DISTANCE_TRAFFIC: to search for routes considering live traffic; Applicable for India only “region=ind” and “rtype=1” is not supported

### Response Parameters

1.  `responseCode`(int): Response codes of the api.
2.  `version`(String): Version of the Api.
3.  `results`(DistanceResults): Array of results, each consisting of the following parameters

#### DistanceResults Response Result Parameters

1.  `code`  : if the request was successful, code is ok.
2.  `durations`(List`<Double[]>`): Duration in seconds for source to source (default 0), 1st, 2nd, 3rd secondary locations... from source.
3.  `distances`(List`<Double[]>`): Distance in meters for source to source (default 0), 1st, 2nd, 3rd secondary locations... from source.


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