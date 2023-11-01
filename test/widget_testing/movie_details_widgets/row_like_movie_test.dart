import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/like_button.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/row_like_movie.dart';

void main() {
  testWidgets(
    'Row like movie widget test: It shows a text and the like button',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: RowLikeMovie(),
        ),
      );

      expect(find.text("Enjoy this movie? Give it a Like!"), findsOneWidget);
      expect(find.byType(LikeButton), findsOneWidget);
    },
  );
}
