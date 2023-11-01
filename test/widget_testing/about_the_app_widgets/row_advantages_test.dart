import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/about_the_app_presentation_widgets/row_advantages.dart';

void main() {
  testWidgets(
    'Row advantages test: It must show the number and the body of each advantage',
    (WidgetTester tester) async {
      const String numberAdvantage = "5";
      const String textAdvantage = "Advantage body";
      await tester.pumpWidget(
        const MaterialApp(
          home: RowAdvantages(
            numberAdvantage: numberAdvantage,
            textAdvantage: textAdvantage,
          ),
        ),
      );
      expect(find.text(numberAdvantage), findsOneWidget);
      expect(find.text(textAdvantage), findsOneWidget);

      const double fontSize = 50;
      final Text numberText = tester.firstWidget(find.text(numberAdvantage));
      final Text advantageText = tester.firstWidget(find.text(textAdvantage));

      expect(numberText.style?.fontSize, fontSize);
      expect(numberText.style?.color, Colors.redAccent);
      expect(numberText.style?.fontWeight, FontWeight.bold);

      expect(advantageText.style?.color, Colors.white);
    },
  );
}
