import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/text_release_date.dart';

void main() {
  testWidgets(
    'Text release date widget test: It should have a text widget that shows the information about the release date',
    (WidgetTester tester) async {
      const String releaseDate = "Release Date";
      await tester.pumpWidget(
        const MaterialApp(
          home: TextReleaseDate(releaseDate),
        ),
      );

      expect(find.text(releaseDate), findsOneWidget);
    },
  );
}
