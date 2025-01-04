import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taski_to_do/core/widgets/profile.dart';

void main() {
  group("Profile Widget test", () {
    testWidgets("renders name and image correctly",
        (WidgetTester tester) async {
      const testName = "Lucas";

      //build the Profile widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Profile(name: testName),
        ),
      );

      //verify the name is rendered
      expect(find.text(testName), findsOneWidget);

      // Verify the image inside the ClipOval is rendered.
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
