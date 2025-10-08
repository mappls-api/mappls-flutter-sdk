## **Important Note** – Please read first

> The [main](https://github.com/mappls-api/mappls-flutter-sdk/tree/main) branch contains the documentation for releases using the updated Authorization & Authentication mechanism introduced in August 2025.  
> If you wish to use the releases that use the legacy authentication method based on OAuth 2.0, please refer to the [auth-legacy](https://github.com/mappls-api/mappls-flutter-sdk/tree/auth-legacy) branch.


[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)

# Mappls Flutter SDK

**Easy To Integrate Maps & Location APIs & SDKs For Android Applications**

Powered with India's most comprehensive and robust mapping functionalities.

1. You can get your api key to be used in this document here: [Mappls Dashboard](https://auth.mappls.com/console)

2. The sample code is provided to help you understand the basic functionality of Mappls maps & REST APIs working on **Flutter** development platform.

4. Explore through [200+ countries & territories](https://github.com/mappls-api/mappls-rest-apis/blob/main/docs/countryISO.md) with **Global Search, Routing and Mapping APIs & SDKs** by Mappls.

## [Documentation History](#Documentation-History)

| Version | Supported SDK Version |  
| ---- | ---- |    
| [v2.0.0](./README.md) | - Map SDK v2.0.0 <br/> - Place Search Widget v2.0.0 |

For more details of previous documentation versions , [click here](./Doc-History.md)

## [Table Of Content]()
- [Getting Started](./Getting-Started.md)
    * [Installation](./Add-Mappls-SDK.md#installation)
    * [Android Setup](./Add-Mappls-SDK.md#android-setup)
    * [IOS Setup](./Add-Mappls-SDK.md#ios-setup)
    * [Web Setup](./Add-Mappls-SDK.md#web-setup)
- [Mappls Map SDK](./Add-Mappls-Map.md)
    * [Version History](./Add-Mappls-Map.md#version-history)
    * [Import Flutter Map](./Add-Mappls-Map.md#import-flutter-map)
    * [Add Flutter Mappls Map](./Add-Mappls-Map.md#add-flutter-mappls-map)
    * [Map Gesture](./Map-Gestures.md)
        - [Target](./Map-Gestures.md#target)
        - [Tilt](./Map-Gestures.md#tilt)
        - [Bearing](./Map-Gestures.md#bearing)
        - [Zoom](./Map-Gestures.md#zoom)
    * [Map Camera](./Map-Camera)
        - [Camera Position](./Map-Camera#camera-position)
        - [Set Camera Position On Map](./Map-Camera#set-camera-position-on-map)
        - [Camera Animations](./Map-Camera#camera-animations)
            * [Move Camera](./Map-Camera#move-camera)
            * [Ease Camera](./Map-Camera#ease-camera)
            * [Animate Camera](./Map-Camera#animate-camera)
    * [Camera Control](./Camera-Control.md)
        - [Move To Target](./Camera-Control.md#move-to-target)
        - [Move To Target with Zoom](./Camera-Control.md#move-to-target-with-zoom)
        - [Move To Bound](./Camera-Control.md#move-to-bound)
        - [Zoom To](./Camera-Control.md#zoom-to)
        - [Zoom By](./Camera-Control.md#zoom-by)
        - [Zoom In](./Camera-Control.md#zoom-in)
        - [Zoom Out](./Camera-Control.md#zoom-out)
    * [Map Events](./Map-Events.md)
        - [Map Click Event](./Map-Events.md#map-click-event)
        - [Map Long Click Event](./Map-Events.md#map-long-click-event)
        - [Camera Movement Ended](./Map-Events.md#camera-movement-ended)
    * [Map Overlays](./Map-Overlay.md)
        - [Marker](./Map-Overlay.md#marker)
            * [Add Marker](./Map-Overlay.md#add-marker)
            * [Custom Marker](./Map-Overlay.md#custom-marker)
            * [Remove Marker](./Map-Overlay.md#remove-marker)
        - [Polyline](./Map-Overlay.md#polyline)
            * [Add polyline](./Map-Overlay.md#add-polyline)
            * [Remove Polyline](./Map-Overlay.md#remove-polyline)
        - [Polygon](./Map-Overlay.md#polygon)
            * [Add Polygon](./Map-Overlay.md#add-polygon)
            * [Remove Polygon](./Map-Overlay.md#remove-polygon)
    * [Show Current Location](./Show-User-Location.md)
        - [Show/Hide Current Location On Map](./Show-User-Location.md#showhide-current-location-on-map)
        - [Location Update Callback](./Show-User-Location.md#location-update-callback)
        - [Tracking Mode](./Show-User-Location.md#tracking-mode)
        - [Render Mode](./Show-User-Location.md#render-mode)
    * [Map UI Settings](./Map-UI-Settings.md)
        - [Compass Settings](./Map-UI-Settings.md#compass-settings)
            * [Enable/ Disable compass](./Map-UI-Settings.md#enable-disable-compass)
            * [Gravity of Compass](./Map-UI-Settings.md#gravity-of-compass)
            * [Margins of compass](./Map-UI-Settings.md#margins-of-compass)
        - [Logo Settings](./Map-UI-Settings.md#logo-settings)
            * [Gravity of Logo](./Map-UI-Settings.md#gravity-of-logo)
            * [Margin of Logo](./Map-UI-Settings.md#margin-of-logo)
        - [Enable/Disable Double Tap Zoom](./Map-UI-Settings.md#enabledisable-double-tap-zoom)
        - [Enable/ Disable Map Rotation Gesture](./Map-UI-Settings.md#enable-disable-map-rotation-gesture)
        - [Enable/Disable Map Scrolling Gesture](./Map-UI-Settings.md#enabledisable-map-scrolling-gesture)
        - [Enable/ Disable Map Tilt Gesture](./Map-UI-Settings.md#enable-disable-map-tilt-gesture)
        - [Enable/Disable Zoom Gesture](./Map-UI-Settings.md#enabledisable-zoom-gesture)
- [Mappls Rest Api](./Mappls-Rest-Apis.md)
    * [Search Api](./Search-Api.md)
        - [Auto Suggest](./Search-Api.md#auto-suggest)
        - [Geocoding](./Search-Api.md#geocoding)
        - [Reverse Geocoding](./Search-Api.md#reverse-geocoding)
        - [Nearby Places](./Search-Api.md#nearby-places)
        - [Place Details](./Search-Api.md#place-details)
        - [POI Along the Route](./Search-Api.md#poi-along-the-route)
    * [Routes & Navigation API](./Routing-Api.md)
        - [Routing API](./Routing-Api.md#routing-api)
        - [Driving Distance Matrix API](./Routing-Api.md#driving-distance-matrix-api)  
- [Mappls Search Widget](./Place-Autocomplete-Widget.md)
    - [Getting Started](./Place-Autocomplete-Widget.md#getting-started)
    - [Import Search Widget](./Place-Autocomplete-Widget.md#import-search-widget)
    - [Place Autocomplete](./Place-Autocomplete-Widget.md#place-autocomplete)
    - [Place Picker](./Place-Autocomplete-Widget.md#place-picker)
- [Country List](https://github.com/mappls-api/mappls-rest-apis/blob/main/docs/countryISO.md)

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
