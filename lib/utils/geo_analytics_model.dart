import 'package:mappls_gl/mappls_gl.dart';

class GeoAnalyticsDataModel {
  final MapplsGeoAnalyticsType geoAnalyticsType;
  final List<MapplsGeoAnalyticsRequest> geoAnalyticsParams;
  final String geoBoundType;
  final List<String> geoBound;
  final List<String> propertyName;

  GeoAnalyticsDataModel({
    required this.geoAnalyticsType,
    required this.geoAnalyticsParams,
    required this.geoBoundType,
    required this.geoBound,
    required this.propertyName,
  });
}
