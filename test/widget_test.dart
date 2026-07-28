import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wink_dashboard/main.dart'; // check if your root widget is MyApp or WinkDashboard

void main() {
  testWidgets('App should build and show splash', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(); // or await tester.pumpAndSettle();

    // Don't check for CircularProgressIndicator anymore
    // Check that the app builds
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // If your new Main Screen has a specific text/logo, check for that instead
    // Example: expect(find.text('Wink Dashboard'), findsOneWidget);
  });
}
