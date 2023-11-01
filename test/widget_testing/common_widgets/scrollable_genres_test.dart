import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/domain/entity/genre_entity.dart';
import 'package:movie_card/presentation/widgets/common_widgets/scrollable_genres.dart';

void main() {
  testWidgets(
    'Scrollable genres widget test: It should show a row of genres that is scrollable horizontally. It also checks the box decoration ',
    (WidgetTester tester) async {
      final genres = [
        GenreEntity(id: 1, name: "Acción"),
        GenreEntity(id: 2, name: "Comedia"),
        GenreEntity(id: 3, name: "Drama"),
      ];
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            body: ScrollableGenres(genres: genres),
          ),
        ),
      );

      final singleChildScrollView = find.byType(SingleChildScrollView);
      expect(singleChildScrollView, findsOneWidget);

      final singleChildScrollViewWidget =
          tester.widget<SingleChildScrollView>(singleChildScrollView);
      expect(singleChildScrollViewWidget.scrollDirection, Axis.horizontal);

      expect(find.byType(DecoratedBox), findsNWidgets(genres.length));

      const double radiusDecoratedBox = 10.0;
      const offsetXDecoratedBox = 0.0;
      const offsetYDecoratedBox = 10.0;
      final List<BoxShadow> boxShadow = [
        const BoxShadow(
          color: Color(0x42000000),
          blurRadius: radiusDecoratedBox,
          offset: Offset(offsetXDecoratedBox, offsetYDecoratedBox),
        ),
      ];

      final DecoratedBox decoratedBox = tester.firstWidget(
        find.byType(DecoratedBox),
      );

      final boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(radiusDecoratedBox),
        color: const Color(0x42000000),
        boxShadow: boxShadow,
      );

      expect(decoratedBox.decoration, boxDecoration);

      for (GenreEntity genre in genres) {
        final Text genreText = tester.firstWidget(find.text(genre.name));
        expect(genreText.style?.color, Colors.white);
      }
    },
  );
}
