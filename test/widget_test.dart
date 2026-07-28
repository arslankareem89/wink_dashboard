import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wink_dashboard/main.dart';

void main() {
  testWidgets('App should build and show splash', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify splash shows
    expect(find.text('WINK'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Advance past the 3-second Future.delayed in initState
    await tester.pump(const Duration(seconds: 3));
    
    // One more pump to render next frame
    await tester.pump();
    
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
