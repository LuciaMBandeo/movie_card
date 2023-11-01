import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/common_widgets/text_info.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/row_original_title.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/text_subtitle.dart';

void main() {
  testWidgets(
    'Row original title widget test: It shows two texts about the original title of the movie',
    (WidgetTester tester) async {
      const String originalTitle = "Original Title";
      await tester.pumpWidget(
        const MaterialApp(
          home: RowOriginalTitle(originalTitle),
        ),
      );

      expect(find.byType(TextSubtitle), findsOneWidget);
      expect(find.byType(TextInfo), findsOneWidget);
    },
  );
}
