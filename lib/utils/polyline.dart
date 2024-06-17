import 'dart:math' show pow, sin, cos, pi, sqrt;

class Polyline {
  //  --- Instance Variables
  bool get isPolyline => true;
  String? encodedString;
  List<List<double>>? decodedCoords = [];
  int precision = 5;
  double? distance;
  String unit = 'kilometers';

  //  --- Named Constructors
  /// .Decode(str, p)
  Polyline.decode({this.encodedString, this.precision = 5}) {
    decodedCoords = _decode(encodedString!, precision);
    encodedString = encodedString;
  }

  /// .Encode(coords, p)
  Polyline.encode({this.decodedCoords, this.precision = 5}) {
    encodedString = _encodePoly(decodedCoords!, precision);
    decodedCoords = decodedCoords;
  }

  // .Distance(str, u)
  Polyline.distance({this.encodedString, this.unit = 'kilometers'}) {
    distance = _length(encodedString!, unit);   // _length sets decodedCoords
    encodedString = encodedString;
  }




  //  ------------- ENCODE & DECODE -------------

  /// Decodes encoded polyline string to a [latitude, longitude] coordinates list.
  /// @decode_poly Function
  /// @param {String} str
  /// @param {int} precision
  /// @returns {List<dynamic>}
  List<List<double>> _decode(String str, int precision) {
    int index = 0,
        lat = 0,
        lng = 0,
        shift = 0,
        result = 0;
    int? byte,
        latitudeChange,
        longitudeChange,
        factor = pow(10, precision).toInt();
    // ignore: omit_local_variable_types
    List<List<double>> coordinates = [];

    // Coordinates have variable length when encoded, so just keep
    // track of whether we've hit the end of the string. In each
    // loop iteration, a single coordinate is decoded.
    while (index < str.length) {
      // Reset shift, result, and byte
      byte = null;
      shift = 0;
      result = 0;

      do {
        byte = str.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      latitudeChange = (((result & 1) == 1) ? ~(result >> 1) : (result >> 1));

      shift = result = 0;

      do {
        byte = str.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      longitudeChange = ((result & 1) == 1 ? ~(result >> 1) : (result >> 1));

      lat += latitudeChange;
      lng += longitudeChange;

      coordinates.add([lat / factor, lng / factor]);
    }

    decodedCoords = coordinates;
    return coordinates;
  }

  /// Encodes the given [latitude, longitude] coordinates list to an encoded string.
  /// @encode_poly Function
  /// @param {List<dynamic>} coordinates
  /// @param {int} precision
  /// @returns {String}
  String _encodePoly(List<List<double>> coordinates, int precision) {
    // if (coordinates.length == null) {
    //   return '';
    // }

    int factor = pow(10, precision is int ? precision : 5).toInt();
    var output = _encode(coordinates[0][0], 0, factor) +
        _encode(coordinates[0][1], 0, factor);

    for (var i = 1; i < coordinates.length; i++) {
      var a = coordinates[i], b = coordinates[i - 1];
      output += _encode(a[0], b[0], factor);
      output += _encode(a[1], b[1], factor);
    }

    return output;
  }

  /// Returns the character string
  /// @param {double} current
  /// @param {double} previous
  /// @param {int} factor
  /// @returns {String}
  String _encode(double current, double previous, int factor) {
    final _current = (current * factor).round();
    final _previous = (previous * factor).round();

    var coordinate = _current - _previous;
    coordinate <<= 1;
    if (_current - _previous < 0) {
      coordinate = ~coordinate;
    }

    var output = '';
    while (coordinate >= 0x20) {
      output += String.fromCharCode((0x20 | (coordinate & 0x1f)) + 63);
      coordinate >>= 5;
    }
    output += String.fromCharCode(coordinate + 63);
    return output;
  }


  /// Calculate the distance of the polyline. If radius is not provided, distance is flat, else distance is haversine distance
  /// NOTE: Support flat surface and sphere
  /// @param {string} polyline - The polyline to calculate from
  /// @param  String of 'meter' or 'kilometer' unit - returned unit value.
  /// @return {double} length - unit based on options.radius unit
  double _length(String polyline, String unit) {
    List<List<double>> decodedPolyline;
    decodedPolyline = _decode(polyline, 5);

    // setting class instance vars
    decodedCoords  = decodedPolyline;

    double distanceOfDecoded = 0;
    for (var i = 0; i < decodedPolyline.length - 1; i++) {
      final lat = [decodedPolyline[i][0], decodedPolyline[i][1]];
      final lon = [decodedPolyline[i + 1][0], decodedPolyline[i + 1][1]];

      distanceOfDecoded += _haversineDistance(lat, lon);
    }

    if(unit == 'meter') return  distanceOfDecoded * 1000;
    if(unit == 'kilometer') return distanceOfDecoded;

    distance = distanceOfDecoded;
    return distanceOfDecoded;
  }

  //  ------------- HAVERSINE -------------

  /// Convert Degree to Radian
  /// @param {double} deg - Degree
  /// @return {double} Radia
  double _degToRad(double deg) {
    return (deg * pi) / 180;
  }


  /// Calculate haversine of a number
  /// @param {double} number - input number
  /// @return {double} haversine
  double _haversine(double number) {
    if(number == null) {
      throw TypeError();
    }
    return pow(sin(number / 2), 2).toDouble();
  }


  /// Calculate the haversine distance between 2 points
  /// on the Earth, using radius of 6371 km
  /// @param {List<double>} point1 - lat, lon are mandatory
  /// @param {List<double>} point2 - lat, lon are mandatory
  /// @return {double} distance
  double _haversineDistance(List<double> _point1, List<double> _point2) {
    _point1.map((item) => item != null ?  _degToRad(item) : null);
    _point2.map((item) => item != null ?  _degToRad(item) : null);

    const radius = 6371;
    final point1 = [_point1[0], _point1[1] ];
    final point2 = [_point2[0], _point2[1] ];

    final a = _haversine(point2[0] - point1[0]);
    final b = cos(point1[0]) * cos(point2[0]) * _haversine(point2[1] - point1[1]);
    final distance = 2 * radius * sqrt(a + b);

    return distance;
  }
}
