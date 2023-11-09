import 'package:flutter/material.dart';

import '../../presentation/view/about_the_app_page.dart';
import '../../presentation/view/home_page.dart';
import '../../presentation/view/movie_details_page.dart';

class NamedRoutes {
  static const String homePage = "/";
  static const String movieDetails = "movie_details";
  static const String aboutTheApp = "about_the_app";
}

class MovieRouter {
  static Map<String, WidgetBuilder> routes() {
    return {
      NamedRoutes.homePage: (BuildContext context) => const HomePage(),
      NamedRoutes.movieDetails: (BuildContext context) =>
          const MovieDetailsPage(),
      NamedRoutes.aboutTheApp: (BuildContext context) =>
          const AboutTheAppPage(),
    };
  }
}
