import 'package:flutter/material.dart';
import 'package:mappls_flutter_demo/utils/mappls_color.dart';
import 'package:mappls_gl/mappls_gl.dart';

class LocationCameraOptionWidget extends StatefulWidget {
  @override
  State<LocationCameraOptionWidget> createState() => _LocationCameraOptionWidgetState();
}

class _LocationCameraOptionWidgetState extends State<LocationCameraOptionWidget> {
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(28.6139, 77.2090),
    zoom: 7.0,
  );

  late MapplsMapController mapController;

  MyLocationRenderMode _selectedMode = MyLocationRenderMode.normal;
  MyLocationTrackingMode _selectedTracking = MyLocationTrackingMode.none;

  void _showOptionsBottomSheet({
    required String title,
    required List<Map<String, dynamic>> options,
    required dynamic selectedValue,
    required Function(dynamic) onChanged,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: MapplsColor.secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Stack(
            clipBehavior: Clip.none, // Allow overflow
            children: [
              // Bottom sheet content
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title Container
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MapplsColor.darkThemeStrokeBorder,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: MapplsColor.primaryTextColor,
                        ),
                      ),
                    ),
                  ),

                  // Options List with padding
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(options.length * 2 - 1, (index) {
                          if (index.isEven) {
                            final option = options[index ~/ 2];
                            bool isSelected = option['value'] == selectedValue;
                            return InkWell(
                              onTap: () {
                                onChanged(option['value']);
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: isSelected
                                    ? MapplsColor.primaryColor.withOpacity(0.2)
                                    : Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      option['label'],
                                      style: TextStyle(
                                        color: MapplsColor.primaryTextColor,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                    if (isSelected)
                                      Image.asset(
                                        'assets/mappls_check_icon.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Divider(
                              color: MapplsColor.secondaryTextColor.withOpacity(
                                0,
                              ),
                              height: 0.6,
                              thickness: 0.6,
                              indent: 8,
                              endIndent: 0,
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),

              // Positioned close icon outside the top right corner
              Positioned(
                top: -34,
                right: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.all(0),
                    child: Image.asset(
                      'assets/mappls_close_icon.png',
                      width: 24,
                      height: 24,
                      color: MapplsColor.primaryTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MapplsColor.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFC6D0F7)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Location Camera Option',
          style: TextStyle(color: MapplsColor.primaryTextColor, fontSize: 20.0),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Color(0x723C445B), height: 1.0),
        ),
      ),
      body: MapplsMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
        myLocationRenderMode: _selectedMode,
        myLocationTrackingMode: _selectedTracking,
        onMapCreated: (controller) {
          mapController = controller;
        },
        onCameraTrackingChanged: (cameraMode) {
          setState(() {
            _selectedTracking = cameraMode;
          });
        },
        onCameraTrackingDismissed: () {
          setState(() {
            _selectedTracking = MyLocationTrackingMode.none;
          });
        },
        onStyleLoadedCallback: () async {},
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        color: MapplsColor.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Mode label + button side by side
            Row(
              children: [
                Text(
                  'Mode:',
                  style: TextStyle(
                    color: MapplsColor.primaryTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                ElevatedButton(
                  onPressed: () {
                    _showOptionsBottomSheet(
                      title: 'Choose Mode',
                      selectedValue: _selectedMode,
                      options: [
                        {
                          'label': 'Normal',
                          'value': MyLocationRenderMode.normal,
                        },
                        {
                          'label': 'Compass',
                          'value': MyLocationRenderMode.compass,
                        },
                        {'label': 'GPS', 'value': MyLocationRenderMode.gps},
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedMode = value as MyLocationRenderMode;
                        });
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MapplsColor.primaryColor_95,
                    foregroundColor: MapplsColor.primaryTextColor,
                    side: BorderSide(
                      color: MapplsColor.secondaryTextColor,
                      width: 1,
                    ),
                    minimumSize: Size(50, 40),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            _locationModeToString(_selectedMode),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                            softWrap: true,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/mappls_more_icon.png',
                          width: 16,
                          height: 16,
                          color: MapplsColor.primaryTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            // Tracking label + button side by side
            Row(
              children: [
                Text(
                  'Tracking:',
                  style: TextStyle(
                    color: MapplsColor.primaryTextColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                ElevatedButton(
                  onPressed: () {
                    _showOptionsBottomSheet(
                      title: 'Choose Tracking',
                      selectedValue: _selectedTracking,
                      options: [
                        {'label': 'None', 'value': MyLocationTrackingMode.none},
                        {
                          'label': 'None Compass',
                          'value': MyLocationTrackingMode.noneCompass,
                        },
                        {
                          'label': 'Tracking',
                          'value': MyLocationTrackingMode.tracking,
                        },
                        {
                          'label': 'Tracking Compass',
                          'value': MyLocationTrackingMode.trackingCompass,
                        },
                        {
                          'label': 'Tracking GPS',
                          'value': MyLocationTrackingMode.trackingGps,
                        },
                        {
                          'label': 'Tracking GPS North',
                          'value': MyLocationTrackingMode.trackingGpsNorth,
                        },
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedTracking = value;
                        });
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MapplsColor.darkThemeStrokeBorder,
                    foregroundColor: MapplsColor.primaryTextColor,
                    side: BorderSide(
                      color: MapplsColor.secondaryTextColor,
                      width: 1,
                    ),
                    minimumSize: Size(40, 40),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            _trackingOptionToString(_selectedTracking),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                            softWrap: true,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/mappls_more_icon.png',
                          width: 16,
                          height: 16,
                          color: MapplsColor.primaryTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _locationModeToString(MyLocationRenderMode mode) {
    switch (mode) {
      case MyLocationRenderMode.normal:
        return 'Normal';
      case MyLocationRenderMode.compass:
        return 'Compass';
      case MyLocationRenderMode.gps:
        return 'GPS';
      default:
        return '';
    }
  }

  String _trackingOptionToString(MyLocationTrackingMode option) {
    switch (option) {
      case MyLocationTrackingMode.none:
        return 'None';
      case MyLocationTrackingMode.noneCompass:
        return 'None-compass';
      case MyLocationTrackingMode.tracking:
        return 'Tracking';
      case MyLocationTrackingMode.trackingCompass:
        return 'Tracking Compass';
      case MyLocationTrackingMode.trackingGps:
        return 'Tracking GPS';
      case MyLocationTrackingMode.trackingGpsNorth:
        return 'Tracking GPS North';
      default:
        return '';
    }
  }
}
