import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ureekaphase2_kesehatan/main.dart'; // Change this to your app's import

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const VitaCureApp());

    // Verify that the initial counter value is 0
    expect(find.text('0'), findsOneWidget); // <== This is failing

    // Tap the '+' button
    await tester.tap(find.byIcon(Icons.add));

    // Wait for UI updates
    await tester.pump();

    // Verify the counter has incremented
    expect(find.text('1'), findsOneWidget);
  });
}
