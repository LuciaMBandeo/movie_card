import 'package:flutter/material.dart';
import '../../routes/movie_details.dart';
import '../../routes/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MovieList.routeName,
      routes: {
        MovieList.routeName: (context) => const MovieList(),
        MovieDetails.routeName: (context) => const MovieDetails(),
      },
    );
  }
}
