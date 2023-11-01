import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/presentation/widgets/movie_list_presentation/grid_widgets/grid_row_movie_preview.dart';
import 'package:movie_card/presentation/widgets/movie_list_presentation/grid_widgets/grid_text_title.dart';

void main() {
  testWidgets(
    'Row movie preview grid widget test: It shows a cached image for the backdrop as well as the title of the movie (grid display)',
    (WidgetTester tester) async {
      const String backdrop = "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg";
      const String title = "Five Nights at Freddy's";
      await tester.pumpWidget(
        const MaterialApp(
          home: GridRowMoviePreview(
            backdrop: backdrop,
            title: title,
          ),
        ),
      );

      expect(find.byType(Container), findsNWidgets(2));
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(GridTextTitle), findsOneWidget);

      //containers decoration
      const double radiusDecoratedBox = 5.0;

      final boxDecorationPreview = BoxDecoration(
        borderRadius: BorderRadius.circular(radiusDecoratedBox),
        color: const Color(0x8a000000),
      );

      final Container containerMoviePreview =
          tester.firstWidget(find.byType(Container));
      expect(containerMoviePreview.decoration, boxDecorationPreview);
    },
  );
}
