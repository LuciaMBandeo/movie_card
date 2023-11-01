import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/common_widgets/row_stars.dart';

void main() {
  ///Row stars widget test: It should show the correct number of icons according to the value of the vote average
  testWidgets(
    'Row stars widget test: It should show 5 full stars',
    (WidgetTester tester) async {
      const double voteAverage = 10;
      await tester.pumpWidget(
        const MaterialApp(
          home: StarsRow(voteAverage),
        ),
      );
      expect(
        find.byIcon(Icons.star),
        findsNWidgets(5),
      );
    },
  );

  testWidgets(
    'Row stars widget test: It should show 4 full stars and a the last one is shaded',
    (WidgetTester tester) async {
      const double voteAverage = 9.3;
      await tester.pumpWidget(
        const MaterialApp(
          home: StarsRow(voteAverage),
        ),
      );
      expect(find.byIcon(Icons.star), findsNWidgets(5));
      expect(find.byType(ShaderMask), findsOneWidget);
    },
  );
}
