
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

    @override
  State<StatefulWidget> createState() {
    return _SplashWidgetState();
  }

}

class _SplashWidgetState extends State<SplashWidget> {

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(child: Image.asset('assets/mappls_sdk_logo.png')),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              // Optional: adds spacing from bottom edge
              child: Image.asset('assets/powered_by_icon.png'),
            ),
          ],
        ),
      ),
    );
  }

  void requestLocationPermission() async {
    var status = await Permission.location.status;
    if(status == PermissionStatus.granted) {
      moveToNextScreen();
    } else {
      bool isGranted = await Permission.location.request().isGranted;
      if(!isGranted) {
        Fluttertoast.showToast(msg: "Location Permission is not given", toastLength: Toast.LENGTH_SHORT);
      }
      moveToNextScreen();
    }

  }

  void moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/home_screen');
  }
}