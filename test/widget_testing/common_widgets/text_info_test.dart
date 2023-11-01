import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/common_widgets/text_info.dart';

void main() {
  testWidgets(
    'Text info widget test: It should have a text widget that shows the information about the topic',
    (WidgetTester tester) async {
      const String informationShowed =
          "This shows a bit of information about the topic";
      const double fontSize = 16.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: TextInfo(informationShowed),
        ),
      );

      expect(find.text(informationShowed), findsOneWidget);

      final Text text = (tester.firstWidget(find.text(informationShowed)));
      expect(
        text.style?.color,
        Colors.white,
      );
      expect(
        text.style?.fontSize,
        fontSize,
      );
    },
  );
}
