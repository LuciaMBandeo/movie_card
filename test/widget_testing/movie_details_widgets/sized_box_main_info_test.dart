import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/common_widgets/row_vote_average.dart';
import 'package:movie_card/presentation/widgets/common_widgets/text_title.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/sized_box_main_info.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/text_release_date.dart';

void main() {
  testWidgets(
    'Sized box main info widget test: It shows a all the main information about te movie, such as title, release date and vote average',
    (WidgetTester tester) async {
      const String title = "title";
      const String releaseDate = "release date";
      const num voteAverage = 6;
      await tester.pumpWidget(
        const MaterialApp(
          home: SizedBoxMainInfo(
            title,
            releaseDate,
            voteAverage,
          ),
        ),
      );

      expect(find.byType(TextTitle), findsOneWidget);
      expect(find.byType(TextReleaseDate), findsOneWidget);
      expect(find.byType(RowVoteAverage), findsOneWidget);
    },
  );
}
