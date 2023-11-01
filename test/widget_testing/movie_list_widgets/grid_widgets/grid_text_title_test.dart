import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/movie_list_presentation/grid_widgets/grid_text_title.dart';

void main() {
  testWidgets(
    'Text title grid widget test: It shows the movie title',
    (WidgetTester tester) async {
      const String title = "Movie Title";
      const double fontSize = 20.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: GridTextTitle(title),
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
      expect(text.maxLines, 1);
      expect(text.overflow, TextOverflow.ellipsis);
    },
  );
}
