import 'package:flutter/material.dart';
import 'config/router/movie_router.dart';
import 'presentation/view/movie_details.dart';
import 'presentation/view/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MovieRouter.movieList,
      routes: {
        MovieRouter.movieList: (context) => const MovieList(),
        MovieRouter.movieDetails: (context) => const MovieDetails(),
      },
    );
  }
}
