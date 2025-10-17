import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_flutter_demo/widget/camera/camera_feature_widget.dart';
import 'package:mappls_flutter_demo/widget/event/add_map_widget.dart';
import 'package:mappls_flutter_demo/widget/event/map_long_click_widget.dart';
import 'package:mappls_flutter_demo/widget/event/map_style_widget.dart';
import 'package:mappls_flutter_demo/widget/event/map_traffic_widget.dart';
import 'package:mappls_flutter_demo/widget/home_widget.dart';
import 'package:mappls_flutter_demo/widget/event/map_click_widget.dart';
import 'package:mappls_flutter_demo/widget/layers/geo_analytics_widget.dart';
import 'package:mappls_flutter_demo/widget/layers/heat_map_layer_widget.dart';
import 'package:mappls_flutter_demo/widget/layers/indoor_widget.dart';
import 'package:mappls_flutter_demo/widget/sub_category_widget.dart';
import 'package:mappls_flutter_demo/widget/splash_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mappls Flutter Demo',
      theme: ThemeData(

        // appBarTheme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(1, 27, 30, 39))),
        scaffoldBackgroundColor: MapplsColor.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: kIsWeb ? HomeWidget(): const SplashWidget(),
      routes: <String, WidgetBuilder> {
        '/home_screen': (BuildContext context) => HomeWidget(),
        '/sub_category': (BuildContext context) => SubCategoryWidget(),
        '/add_map': (BuildContext context) => AddMapWidget(),
        '/map_click': (BuildContext context) => MapClickWidget(),
        '/map_long_click': (BuildContext context) => MapLongClickWidget(),
        '/map_style':(BuildContext context) => MapStyleWidget(),
        '/map_traffic':(BuildContext context) => MapTrafficWidget(),
        '/heat_map':(BuildContext context) => HeatMapLayerWidget(),
        '/map_indoor':(BuildContext context) => IndoorWidget(),
        '/geo_analytics':(BuildContext context) => GeoAnalyticsWidget(),
        '/camera_feature':(BuildContext context) => CameraFeatureWidget(),
      },
    );
  }
}