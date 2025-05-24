// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:uber_app/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MainApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

//
//
//
//
//
//
// void main() {
//   runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MainApp()));
// }

// class MainApp extends StatefulWidget {
//   const MainApp({super.key});

//   @override
//   State createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   late GoogleMapController mapController;

//   final LatLng _initialPosition = const LatLng(
//     37.7749,
//     -122.4194,
//   ); // San Francisco

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('blablabla'),
//         backgroundColor: Colors.green,
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _initialPosition,
//           zoom: 10,
//         ),
//       ),
//     );
//   }
// }
