import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/common_widgets/text_title.dart';

void main() {
  testWidgets(
    'Text title widget test: It should have a text widget that shows the title',
    (WidgetTester tester) async {
      const String title = "This shows a bit the title";
      const double fontSize = 20.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: TextTitle(title),
        ),
      );

      expect(find.text(title), findsOneWidget);

      final Text text = (tester.firstWidget(find.text(title)));
      expect(
        text.style?.fontSize,
        fontSize,
      );
      expect(
        text.style?.fontWeight,
        FontWeight.bold,
      );
      expect(
        text.style?.color,
        Colors.white,
      );
    },
  );
}
