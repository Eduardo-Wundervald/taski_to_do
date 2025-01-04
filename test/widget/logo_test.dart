import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taski_to_do/core/widgets/logo.dart';

void main() {
  group("renders icon and text correctly", () {
    testWidgets("renders icon and text correctly", (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Logo(),
        ),
      );
      // Verify the icon and image are rendered.
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        return widget is Image && widget.image is AssetImage;
      }), findsOneWidget);
    });
  });
}
