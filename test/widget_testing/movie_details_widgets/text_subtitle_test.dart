import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/text_subtitle.dart';

void main() {
  testWidgets(
    'Text subtitle widget test: It should have a text widget that shows the subtitle of the movie',
    (WidgetTester tester) async {
      const fontSizeSubtitle = 18.0;
      const String subtitle = "Subtitle";
      await tester.pumpWidget(
        const MaterialApp(
          home: TextSubtitle(subtitle),
        ),
      );

      expect(find.text(subtitle), findsOneWidget);
      final Text text = (tester.firstWidget(find.text(subtitle)));
      expect(
        text.style?.fontSize,
        fontSizeSubtitle,
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
