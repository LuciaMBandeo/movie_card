import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/data/model/movie_preview.dart';
import 'package:movie_card/domain/entity/genre_entity.dart';
import 'package:movie_card/domain/entity/movie_entity.dart';
import 'package:movie_card/presentation/view/movie_details_page.dart';
import 'package:movie_card/presentation/widgets/movie_list_presentation/grid_widgets/grid_container_movie_preview.dart';
import 'package:movie_card/presentation/widgets/movie_list_presentation/grid_widgets/grid_row_movie_preview.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Mock implements Route {}

void main() {
  late NavigatorObserver mockObserver;
  setUp(() {
    mockObserver = MockNavigatorObserver();
    registerFallbackValue(MockRoute());
  });

  testWidgets(
    'Container movie preview grid widget test: It should have a card widget that contains the backdrop and title of the movie (grid display)',
    (WidgetTester tester) async {
      final MovieEntity movie = MovieEntity(
        adult: false,
        backdrop: "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
        genres: [27, 53],
        id: 507089,
        originalLanguage: "en",
        originalTitle: "Five Nights at Freddy's",
        overview:
            "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.",
        popularity: 2596.506,
        poster: "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
        releaseDate: "2023-10-25",
        title: "Five Nights at Freddy's",
        video: false,
        voteAverage: 8.7,
        voteCount: 340,
      );
      final List<GenreEntity> genres = [
        GenreEntity(id: 1, name: "Acción"),
        GenreEntity(id: 2, name: "Comedia"),
        GenreEntity(id: 3, name: "Drama"),
      ];
      final moviePreview = MoviePreview(movie, genres);

      Future<void> buildMainPage(WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            routes: {
              '/': (context) => GridContainerMoviePreview(movie: moviePreview),
              '/movie_details': (context) => const MovieDetailsPage(),
            },
            navigatorObservers: [mockObserver],
          ),
        );

        verify(() => mockObserver.didPush(any(), any())).called(1);
      }

      Future<void> navigateToDetailsPage(WidgetTester tester) async {
        final card = tester.firstWidget(find.byType(Card));
        await tester.tap(find.byWidget(card));
        await tester.pumpAndSettle();
      }

      await buildMainPage(tester);
      expect(find.byType(GridRowMoviePreview), findsOneWidget);
      await navigateToDetailsPage(tester);
      expect(find.byType(MovieDetailsPage), findsOneWidget);
    },
  );
}
