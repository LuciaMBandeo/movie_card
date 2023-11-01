import 'package:flutter/material.dart';

import 'config/router/movie_router.dart';
import 'presentation/view/about_the_app_page.dart';
import 'presentation/view/home_page.dart';
import 'presentation/view/movie_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MovieRouter.homePage: (context) => const HomePage(),
        MovieRouter.movieDetails: (context) => const MovieDetailsPage(),
        MovieRouter.aboutTheApp: (context) => const AboutTheAppPage(),
      },
    );
  }
}
