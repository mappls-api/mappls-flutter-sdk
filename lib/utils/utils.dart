
import 'package:mappls_flutter_demo/model/category_model.dart';
import 'package:mappls_flutter_demo/model/sub_category_model.dart';

class Utils {
  static List<CategoryModel> mapplsHomeList = [
    CategoryModel(type: 0, name: 'Map Events', icon: 'assets/map_events_icon.png'),
  ];

  static List<SubCategoryModel> mapEvents = [
    SubCategoryModel(name: 'Add Map', description: 'Add a simple Map', icon: 'assets/add_map_icon.png', route: '/add_map'),
    SubCategoryModel(name: 'Map Tap', description: 'Single tap event on map', icon: 'assets/map_click_icon.png', route: '/map_click'),
    SubCategoryModel(name: 'Map Long Tap', description: 'Long Press event on map', icon: 'assets/map_long_click_icon.png', route: '/map_long_click'),
    SubCategoryModel(name: 'Map Style', description: 'Check out the diverse map styles Mappls Offer', icon: 'assets/map_long_click_icon.png', route: '/map_style'),
    SubCategoryModel(name: 'Map Traffic', description: 'Visualize Traffic services on Map', icon: 'assets/map_long_click_icon.png', route: '/map_traffic'),
  ];

  static List<SubCategoryModel> getSubCategoryList(int type) {
    switch (type) {
      case 0:
        return mapEvents;
      case 1:
        return [];
      default:
        return [];
    }
  }

  static String getTitle(int type) {
    switch (type) {
      case 0:
        return 'Map Events';
      default:
        return '';
    }
  }
}