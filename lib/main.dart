import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(37.7749, -122.4194), // San Francisco coordinates
            zoom: 10,
          ),
        ),
      ),
    );
  }
}
