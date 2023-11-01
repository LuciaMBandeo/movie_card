import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/like_button.dart';

void main() {
  testWidgets(
    'Like button widget test: It should show a like red icon that is filled when tapped as well as a counter that increases every time the button its clicked',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LikeButton(),
        ),
      );

      expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);

      await tester.tap(find.byType(LikeButton));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
      expect(find.text("Likes (1)"), findsOneWidget);
    },
  );
}
