
import 'package:mappls_flutter_demo/model/category_model.dart';
import 'package:mappls_flutter_demo/model/heat_map_option.dart';
import 'package:mappls_flutter_demo/model/sub_category_model.dart';
import 'package:mappls_gl/mappls_gl.dart';

class Utils {

  static List<HeatMapOption> heatMapOptions = [
    HeatMapOption(latLng: LatLng(28.1016, 77.5129), mag: 2.3),
    HeatMapOption(latLng: LatLng(28.1021, 77.5132), mag: 2.0),
    HeatMapOption(latLng: LatLng(28.1224, 76.4048), mag: 1.7),
    HeatMapOption(latLng: LatLng(28.0781, 77.3597), mag: 1.6),
  ];

  static List<CategoryModel> mapplsHomeList = [
    CategoryModel(type: 0, name: 'Map Events', icon: 'assets/map_events_icon.png'),
    CategoryModel(type: 1, name: 'Map Layers', icon: 'assets/map_layer_icon.png'),
  ];

  static List<SubCategoryModel> mapEvents = [
    SubCategoryModel(name: 'Add Map', description: 'Add a simple Map', icon: 'assets/add_map_icon.png', route: '/add_map'),
    SubCategoryModel(name: 'Map Tap', description: 'Single tap event on map', icon: 'assets/map_click_icon.png', route: '/map_click'),
    SubCategoryModel(name: 'Map Long Tap', description: 'Long Press event on map', icon: 'assets/map_long_click_icon.png', route: '/map_long_click'),
    SubCategoryModel(name: 'Map Style', description: 'Check out the diverse map styles Mappls Offer', icon: 'assets/map_long_click_icon.png', route: '/map_style'),
    SubCategoryModel(name: 'Map Traffic', description: 'Visualize Traffic services on Map', icon: 'assets/map_long_click_icon.png', route: '/map_traffic'),
  ];

  static List<SubCategoryModel> mapLayers = [
    SubCategoryModel(name: 'Heat Map', description: 'Add and visualize data in Heat Style', icon: 'assets/heat_map_icon.png', route: '/heat_map'),
    SubCategoryModel(name: 'Indoor Map', description: 'Mappls Indoor Widget to focus on multi-storey buildings structure and floor wise data on map.', icon: 'assets/indoor_map_icon.png', route: '/map_indoor'),
  ];

  static List<SubCategoryModel> getSubCategoryList(int type) {
    switch (type) {
      case 0:
        return mapEvents;
      case 1:
        return mapLayers;
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
      default:
        return '';
    }
  }
}