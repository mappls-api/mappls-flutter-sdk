[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)

# Mappls Flutter SDK

**Easy To Integrate Maps & Location APIs & SDKs For Android Applications**

Powered with India's most comprehensive and robust mapping functionalities.

1. You can get your api key to be used in this document here: [https://about.mappls.com/api/signup](https://about.mappls.com/api/signup)

2. The sample code is provided to help you understand the basic functionality of Mappls maps & REST APIs working on **Flutter** development platform.

4. Explore through [200+ countries & territories](https://github.com/mappls-api/mappls-rest-apis/blob/main/docs/countryISO.md) with **Global Search, Routing and Mapping APIs & SDKs** by Mappls.

## [Documentation History](#Documentation-History)

| Version               | Supported SDK Version |  
|-----------------------| ---- |    
| [v1.0.0](./README.md) | - Map SDK v1.0.1 <br/> - Place Search Widget v1.0.0 <br/> - GeoFence Widget v1.0.0 <br/> - Direction Widget v1.0.0 <br/> - Nearby UI Widget v1.0.0 <br/> - Mappls Polyline v1.0.0 |

## [Version History](#Version-History)
| Version | Last Updated | Author |  Release Note| 
| ---- | ---- | ---- | ---- |
| v1.0.1 | 04 December 2023 | Mappls API Team ([MA](https://github.com/mdakram)) ([ST](https://github.com/saksham66)) |   - Security Improvements <br/> - Bug Fixes |
| v1.0.0 | 06 March 2023 | Mappls API Team ([MA](https://github.com/mdakram)) ([ST](https://github.com/saksham66)) |   -Initial release  |

For more details of previous versions , [click here](./Version-History.md).

## [Table Of Content](#Table-Of-Content)
- [Vector Map](./Getting-Started.md)
  - [Getting Started](./Getting-Started.md#getting-started)
  - [API Usage](./Getting-Started.md#api-usage)
  - [Installation](./Getting-Started.md#installation)
  - [Add Your API keys to the SDK](./Getting-Started.md#add-your-api-keys-to-the-sdk)
  - [Add Mappls Map to your application](./Getting-Started.md#add-mappls-map-to-your-application)
  - [Map Interactions](./Getting-Started.md#map-interactions)
  - [Map Events](./Getting-Started.md#map-events)
  - [Map Overlays](./Getting-Started.md#map-overlays)
    - [Add a Marker](./Getting-Started.md#add-a-marker)
    - [Remove a Marker](./Getting-Started.md#remove-a-marker)
    - [Customize a marker](./Getting-Started.md#customize-a-marker)
    - [Add a Polyline](./Getting-Started.md#add-a-polyline)
    - [Remove a Polyline](./Getting-Started.md#remove-a-polyline)
    - [Add a Polygon](./Getting-Started.md#add-a-polygon)
    - [Remove a Polygon](./Getting-Started.md#remove-a-polygon)
    - [Show User location](./Getting-Started.md#show-user-location)
- [Map Ui Settings](./Map-Ui-Settings.md)
  - [Compass Setting](./Map-Ui-Settings.md#compass-settings)
  - [Logo Settings](./Map-Ui-Settings.md#logo-settings)
  - [Enable/ Disable Map Rotation Gesture](./Map-Ui-Settings.md#enable-disable-map-rotation-gesture)
  - [Enable/Disable Map Scrolling Gesture](./Map-Ui-Settings.md#enabledisable-map-scrolling-gesture)
  - [Enable/ Disable Map Tilt Gesture](./Map-Ui-Settings.md#enable-disable-map-tilt-gesture)
  - [Enable/Disable Zoom Gesture](./Map-Ui-Settings.md#enabledisable-zoom-gesture)
- [Set Mappls Map style](./Mappls-Map-Style.md)
  - [List of Available Styles](./Mappls-Map-Style.md#list-of-available-styles)
  - [Set Mappls Style](./Mappls-Map-Style.md#set-mappls-style)
  - [To enable/disable last selected style](./Mappls-Map-Style.md#to-enabledisable-last-selected-style)
  - [Get Selected style](./Mappls-Map-Style.md#get-selected-style)
- [Rest APIs]
  - [Search APIs](./Search-Api.md)
    - [Autosuggest](./Search-Api.md#auto-suggest)
    - [Geocoding](./Search-Api.md#geocoding)
    - [Reverse Geocoding](./Search-Api.md#reverse-geocoding)
    - [Nearby Places](./Search-Api.md#nearby-places)
    - [Place Details](./Search-Api.md#place-details)
    - [POI Along the Route](./Search-Api.md#poi-along-the-route)
  - [Routes & Navigation API](./Routing-Api.md)
    - [Routing API](./Routing-Api.md#routing-api)
    - [Driving Distance Matrix API](./Routing-Api.md#driving-distance-matrix-api)
- [Mappls Pin Strategy](./Mappls-Pin-Strategy.md)
- [Mappls Search Widget](./Place-Autocomplete-Widget.md)
  - [Getting Started](./Place-Autocomplete-Widget.md#getting-started)
  - [Adding Mappls Keys](./Place-Autocomplete-Widget.md#adding-mappls-keys)
  - [Place Autocomplete](./Place-Autocomplete-Widget.md#place-autocomplete)
  - [Place Picker](./Place-Autocomplete-Widget.md#place-picker)
- [Mappls Direction Widget](./Direction-Ui.md)
  - [Getting Started](./Direction-Ui.md#getting-started)
  - [Adding Mappls Keys](./Direction-Ui.md#adding-mappls-keys)
  - [Add Direction Widget](./Direction-Ui.md#add-direction-widget)
- [Mappls Nearby Widget](./Nearby-Widget.md)
  - [Getting Started](./Nearby-Widget.md#getting-started)
  - [Adding Mappls Keys](./Nearby-Widget.md#adding-mappls-keys)
  - [Add Nearby Widget](./Nearby-Widget.md#add-nearby-widget)

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