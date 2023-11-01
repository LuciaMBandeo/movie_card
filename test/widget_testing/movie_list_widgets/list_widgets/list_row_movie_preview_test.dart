import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/domain/entity/genre_entity.dart';
import 'package:movie_card/presentation/widgets/common_widgets/row_vote_average.dart';
import 'package:movie_card/presentation/widgets/common_widgets/scrollable_genres.dart';
import 'package:movie_card/presentation/widgets/common_widgets/text_title.dart';
import 'package:movie_card/presentation/widgets/movie_list_presentation/list_widgets/list_row_movie_preview.dart';

void main() {
  testWidgets(
    'Row movie preview list widget test: It shows a cached image for the poster as well as the title, vote average and list of genres of the movie (list display)',
    (WidgetTester tester) async {
      const String poster = "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg";
      const String title = "Five Nights at Freddy's";
      final List<GenreEntity> genres = [
        GenreEntity(id: 1, name: "Acción"),
        GenreEntity(id: 2, name: "Comedia"),
        GenreEntity(id: 3, name: "Drama"),
      ];
      const num voteAverage = 5.7;
      await tester.pumpWidget(
        MaterialApp(
          home: ListRowMoviePreview(
            poster: poster,
            title: title,
            genres: genres,
            voteAverage: voteAverage,
          ),
        ),
      );

      expect(find.byType(Container), findsNWidgets(2));
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(TextTitle), findsOneWidget);
      expect(find.byType(RowVoteAverage), findsOneWidget);
      expect(find.byType(ScrollableGenres), findsOneWidget);

      //container decoration
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
