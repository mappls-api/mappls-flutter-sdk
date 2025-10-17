import 'package:mappls_flutter_demo/model/category_model.dart';
import 'package:mappls_flutter_demo/model/heat_map_option.dart';
import 'package:mappls_flutter_demo/model/sub_category_model.dart';
import 'package:mappls_flutter_demo/utils/geo_analytics_model.dart';
import 'package:mappls_gl/mappls_gl.dart';

class Utils {
  static List<HeatMapOption> heatMapOptions = [
    HeatMapOption(latLng: LatLng(28.1016, 77.5129), mag: 2.3),
    HeatMapOption(latLng: LatLng(28.1021, 77.5132), mag: 2.0),
    HeatMapOption(latLng: LatLng(28.1224, 76.4048), mag: 1.7),
    HeatMapOption(latLng: LatLng(28.0781, 77.3597), mag: 1.6),
    HeatMapOption(latLng: LatLng(28.0781, 77.3597), mag: 1.6),
    HeatMapOption(latLng: LatLng(28.1725, 74.789), mag: 2.4),
    HeatMapOption(latLng: LatLng(28.674242, 74.2832), mag: 1.3),
    HeatMapOption(latLng: LatLng(24.6778728, 80.8244288), mag: 2.4),
    HeatMapOption(latLng: LatLng(24.6778728, 81.637417), mag: 3.2),
    HeatMapOption(latLng: LatLng(27.8302397, 77.7372706), mag: 1.2),
    HeatMapOption(latLng: LatLng(28.3729432, 79.2973292), mag: 4.2),
    HeatMapOption(latLng: LatLng(26.2351935, 79.7477686), mag: 2.13),
    HeatMapOption(latLng: LatLng(26.1760509, 80.1762354), mag: 3.2),
    HeatMapOption(latLng: LatLng(27.333618, 79.7367823), mag: 1.2),
    HeatMapOption(latLng: LatLng(26.628706, 80.9452784), mag: 5.2),
    HeatMapOption(latLng: LatLng(28.9032672, 78.6930811), mag: 3.2),
    HeatMapOption(latLng: LatLng(29.3255866, 78.73702641), mag: 4.0),
    HeatMapOption(latLng: LatLng(29.5838759, 79.4181788), mag: 5.0),
  ];

  static List<GeoAnalyticsDataModel> geoAnalyticsList = [
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.STATE,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "HARYANA",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "42a5f4",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
        MapplsGeoAnalyticsRequest(
          geoBound: "UTTAR PRADESH",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "42a5f4",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
        MapplsGeoAnalyticsRequest(
          geoBound: "ANDHRA PRADESH",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "42a5f4",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
        MapplsGeoAnalyticsRequest(
          geoBound: "KERALA",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "42a5f4",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["HARYANA", "UTTAR PRADESH", "ANDHRA PRADESH", "KERALA"],
      geoBoundType: "stt_nme",
      propertyName: ["stt_nme", "stt_id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.DISTRICT,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "BIHAR",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "8bc34a",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
        MapplsGeoAnalyticsRequest(
          geoBound: "UTTARAKHAND",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "8bc34a",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["BIHAR", "UTTARAKHAND"],
      geoBoundType: "stt_nme",
      propertyName: ["dst_nme", "dst_id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.SUB_DISTRICT,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "HIMACHAL PRADESH",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "ffa000",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
        MapplsGeoAnalyticsRequest(
          geoBound: "TRIPURA",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "ffa000",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["HIMACHAL PRADESH", "TRIPURA"],
      geoBoundType: "stt_nme",
      propertyName: ["sdb_nme", "sdb_id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.WARD,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "0001",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "ff5722",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["0001"],
      geoBoundType: "ward_no",
      propertyName: ["ward_no", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.LOCALITY,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "DELHI",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "00695c",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["DELHI"],
      geoBoundType: "stt_nme",
      propertyName: ["loc_nme", "loc_id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.PANCHAYAT,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "ASSAM",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "b71c1c",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["ASSAM"],
      geoBoundType: "stt_nme",
      propertyName: ["loc_nme", "loc_id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.BLOCK,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "DELHI",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "3f51b5",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["DELHI"],
      geoBoundType: "stt_nme",
      propertyName: ["blk_nme", "blk_id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.PINCODE,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "KARNATAKA",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "00bcd4",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["KARNATAKA"],
      geoBoundType: "stt_nme",
      propertyName: ["pincode"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.TOWN,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "PUNJAB",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "9ccc65",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["PUNJAB"],
      geoBoundType: "stt_nme",
      propertyName: ["twn_nme", "twn_id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.CITY,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "TAMIL NADU",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "78909c",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["TAMIL NADU"],
      geoBoundType: "stt_nme",
      propertyName: ["city_nme", "city_id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.VILLAGE,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "GOA",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "f06292",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["GOA"],
      geoBoundType: "stt_nme",
      propertyName: ["vil_nme", "id", "t_p"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.SUB_LOCALITY,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "UTTAR PRADESH",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "f06292",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
        MapplsGeoAnalyticsRequest(
          geoBound: "BIHAR",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "f06292",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["UTTAR PRADESH", "BIHAR"],
      geoBoundType: "stt_nme",
      propertyName: ["subl_nme", "subl_id"],
    ),
    GeoAnalyticsDataModel(
      geoAnalyticsType: MapplsGeoAnalyticsType.SUB_SUB_LOCALITY,
      geoAnalyticsParams: [
        MapplsGeoAnalyticsRequest(
          geoBound: "UTTAR PRADESH",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "f06292",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
        MapplsGeoAnalyticsRequest(
          geoBound: "BIHAR",
          style: MapplsGeoAnalyticsAppearanceOption(
            fillColor: "f06292",
            fillOpacity: 0.5,
            strokeColor: "000000",
            labelSize: 10,
            strokeWidth: 0.0,
            labelColor: "000000",
          ),
        ),
      ],
      geoBound: ["UTTAR PRADESH", "BIHAR"],
      geoBoundType: "stt_nme",
      propertyName: ["sslc_nme", "sslc_id"],
    ),
  ];

  static List<CategoryModel> mapplsHomeList = [
    CategoryModel(
      type: 0,
      name: 'Map Events',
      icon: 'assets/map_events_icon.png',
    ),
    CategoryModel(
      type: 1,
      name: 'Map Layers',
      icon: 'assets/map_layer_icon.png',
    ),
    CategoryModel(type: 2, name: 'Camera', icon: 'assets/map_camera_icon.png')
  ];

  static List<SubCategoryModel> mapEvents = [
    SubCategoryModel(
      name: 'Add Map',
      description: 'Add a simple Map',
      icon: 'assets/add_map_icon.png',
      route: '/add_map',
    ),
    SubCategoryModel(
      name: 'Map Tap',
      description: 'Single tap event on map',
      icon: 'assets/map_click_icon.png',
      route: '/map_click',
    ),
    SubCategoryModel(
      name: 'Map Long Tap',
      description: 'Long Press event on map',
      icon: 'assets/map_long_click_icon.png',
      route: '/map_long_click',
    ),
    SubCategoryModel(
      name: 'Map Style',
      description: 'Check out the diverse map styles Mappls Offer',
      icon: 'assets/map_long_click_icon.png',
      route: '/map_style',
    ),
    SubCategoryModel(
      name: 'Map Traffic',
      description: 'Visualize Traffic services on Map',
      icon: 'assets/map_long_click_icon.png',
      route: '/map_traffic',
    ),
  ];

  static List<SubCategoryModel> mapLayers = [
    SubCategoryModel(
      name: 'Heat Map',
      description: 'Add and visualize data in Heat Style',
      icon: 'assets/heat_map_icon.png',
      route: '/heat_map',
    ),
    SubCategoryModel(
      name: 'Indoor Map',
      description:
          'Mappls Indoor Widget to focus on multi-storey buildings structure and floor wise data on map.',
      icon: 'assets/indoor_map_icon.png',
      route: '/map_indoor',
    ),
    SubCategoryModel(
      name: 'GeoAnalytics Plugin',
      description:
          'Visualize Administrative Layers on Map as WMS Layers Available with Mappls Database.',
      icon: 'assets/indoor_map_icon.png',
      route: '/geo_analytics',
    ),
  ];
  static List<SubCategoryModel> cameraFeature = [
    SubCategoryModel(
      name: 'Camera Feature',
      description:
      'Explore camera features like Move Camera, Ease Camera & Animate Camera',
      icon: 'assets/indoor_map_icon.png',
      route: '/camera_feature',
    ),
  ];

  static List<SubCategoryModel> getSubCategoryList(int type) {
    switch (type) {
      case 0:
        return mapEvents;
      case 1:
        return mapLayers;
      case 2:
        return cameraFeature;
      default:
        return [];
    }
  }

  static String getTitle(int type) {
    switch (type) {
      case 0:
        return 'Map Events';
      case 1:
        return 'Map Layers';
      case 2:
        return 'Camera';
      default:
        return '';
    }
  }
}