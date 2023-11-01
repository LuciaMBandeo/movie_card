import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/common_widgets/row_stars.dart';
import 'package:movie_card/presentation/widgets/common_widgets/row_vote_average.dart';

void main() {
  testWidgets(
    'Row vote average widget test: It must find the StarsRow widget and the Text for the vote average',
    (WidgetTester tester) async {
      const double voteAverage = 7.5;
      await tester.pumpWidget(
        const MaterialApp(
          home: RowVoteAverage(voteAverage),
        ),
      );

      expect(find.byType(StarsRow), findsOneWidget);
      expect(find.text("($voteAverage)"), findsOneWidget);
    },
  );
}
