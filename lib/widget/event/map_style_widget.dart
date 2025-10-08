import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class MapStyleWidget extends StatefulWidget {
  const MapStyleWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapStyleState();
  }
}

class _MapStyleState extends State<MapStyleWidget> {
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(22.553147478403194, 77.23388671875),
    zoom: 4.0,
  );

  MapplsMapController? _mapController;
  bool _isLoadMap = false;
  List<MapplsStyle> _styles = [];
  String? styleName = null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // remove shadow to show separator
        backgroundColor: MapplsColor.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFC6D0F7)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Map Style',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // height of the line
          child: Container(
            color: Color(0x723C445B), // color of the line
            height: 1.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          MapplsMap(
            initialCameraPosition: _cameraPosition,
            mapplsStyle: styleName,
            onMapCreated: (controller) async {
              _mapController = controller;
              setState(() => _isLoadMap = true);
              await _loadAvailableStyles();
            },
          ),

          // Style selector panel
          if (_styles.isNotEmpty)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              height: 120,
              child: PageView.builder(
                itemCount: _styles.length,
                controller: PageController(
                  viewportFraction:
                      0.9, // Optional: makes the item slightly smaller to hint at next/prev
                ),
                itemBuilder: (context, index) {
                  final style = _styles[index];
                  return GestureDetector(
                    onTap: () => _applyStyle(style),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.all(6), // Add some padding
                      decoration: BoxDecoration(
                        color: MapplsColor.primaryColor_95,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: style.imageUrl != null
                                  ? Image.network(
                                      style.imageUrl!,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(Icons.map),
                                    )
                                  : Container(
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.map),
                                    ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                style.name ?? "Style",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MapplsColor.primaryTextColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                style.description ?? "",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: MapplsColor.secondaryTextColor,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(width: 4)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _loadAvailableStyles() async {
    if (_mapController != null) {
      final styles = await _mapController!.getMapplsAvailableStyles();
      setState(() {
        _styles = styles;
      });
    }
  }

  void _applyStyle(MapplsStyle style) {
    if (_mapController != null && style.name != null) {
      setState(() {
        styleName = style.name;
      });
    }
  }
}
