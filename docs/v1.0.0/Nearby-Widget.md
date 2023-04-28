[<img src="https://about.mappls.com/images/mappls-b-logo.svg" height="60"/> </p>](https://www.mapmyindia.com/api)

# Mappls Nearby Widget

The Mappls Nearby Widget makes it easy to integrate the functionality to search nearby POIs for selected categories in your Flutter application. The Nearby Search widget provided as a means to enable radially search for Nearby Places on Mappls Maps.
The widget offers the following basic functionalities:
- Ability to search for nearby places directly with Mappls Maps visual interface.
- A single method to initiate nearby search across all categories of places available on Mappls.
- Ability to get information from Mappls Nearby Search widget through a callback.

This can be done by following simple steps.

## Getting Started
To work with Mappls nearby Widget in flutter add these to your package's pubspec.yaml file:
~~~yaml  
dependencies:  
  mappls_nearby_plugin: ^1.0.0
~~~  

Now in your dart code you need to import this package:
~~~dart  
import 'package:mappls_nearby_plugin/mappls_nearby_plugin.dart';
~~~  



## Adding Mappls Keys

You **must** provide your keys through the `MapplsAccountManager` class.([click here](https://github.com/mappls-api/mappls-flutter-sdk/blob/main/docs/v1.0.0/Getting-Started.md#add-your-api-keys-to-the-sdk))

## Add Nearby Widget

Use method `openNearbyWidget` to open Nearby Widget:
~~~dart
// Platform messages may fail, so we use a try/catch PlatformException.  
try {  
  
 NearbyResult nearbyResult = await openNearbyWidget(); 
} on PlatformException {  
    
}
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




<div align="center">@ Copyright 2023 CE Info Systems Ltd. All Rights Reserved.</div>      

<div align="center"> <a href="https://about.mappls.com/api/terms-&-conditions">Terms & Conditions</a> | <a href="https://about.mappls.com/about/privacy-policy">Privacy Policy</a> | <a href="https://about.mappls.com/pdf/mapmyIndia-sustainability-policy-healt-labour-rules-supplir-sustainability.pdf">Supplier Sustainability Policy</a> | <a href="https://about.mappls.com/pdf/Health-Safety-Management.pdf">Health & Safety Policy</a> | <a href="https://about.mappls.com/pdf/Environment-Sustainability-Policy-CSR-Report.pdf">Environmental Policy & CSR Report</a>      

<div align="center">Customer Care: +91-9999333223</div>