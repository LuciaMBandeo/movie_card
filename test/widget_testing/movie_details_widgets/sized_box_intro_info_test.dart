import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/sized_box_intro_info.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/sized_box_main_info.dart';
import 'package:movie_card/presentation/widgets/movie_details_presentation_widgets/sized_box_poster.dart';

void main() {
  testWidgets(
    'Sized box intro info widget test: It shows a cached backdrop image, and a row with the poster and some information as introduction',
        (WidgetTester tester) async {
      const String backdrop = "backdrop";
      const String poster = "poster";
      const String title = "title";
      const String releaseDate = "release date";
      const num voteAverage = 6;
      await tester.pumpWidget(
        const MaterialApp(
          home: SizedBoxIntroInfo(
            backdrop,
            poster,
            title,
            releaseDate,
            voteAverage,
          ),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsNWidgets(2));

      expect(find.byType(SizedBoxPoster), findsOneWidget);
      expect(find.byType(SizedBoxMainInfo), findsOneWidget);
    },
  );
}
