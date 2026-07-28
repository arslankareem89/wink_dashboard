import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wink_dashboard/main.dart';

void main() {
  testWidgets('App should build and show splash', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('WINK'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Important: advance clock to clear the Future.delayed timer
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
