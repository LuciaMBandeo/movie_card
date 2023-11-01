import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/sized_box_poster.dart';

void main() {
  testWidgets(
    'Sized box poster widget test: It shows a cached poster image',
    (WidgetTester tester) async {
      const String poster = "poster";
      await tester.pumpWidget(
        const MaterialApp(
          home: SizedBoxPoster(poster),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsOneWidget);
    },
  );
}
