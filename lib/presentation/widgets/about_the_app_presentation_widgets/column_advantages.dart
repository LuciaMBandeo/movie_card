import 'package:flutter/material.dart';

import 'row_advantages.dart';

class ColumnAdvantages extends StatelessWidget {
  const ColumnAdvantages({
    super.key,
  });

  static const String _advantageOne = "1";
  static const String _advantageTwo = "2";
  static const String _advantageThree = "3";
  static const String _advantageFour = "4";
  static const String _advantageFive = "5";
  static const String _advantageOneText =
      "Every year since 2008, the number of contributions to the database has increased! With over 1,000,000 developers and companies using the platform, TMDB has become a premiere source for metadata.";
  static const String _advantageTwoText =
      "Along with extensive metadata for movies, TV shows and people, they also offer one of the best selections of high resolution posters and fanart. On average, over 1,000 images are added every single day.";
  static const String _advantageThreeText =
      "They're international. While they officially support 39 languages they also have extensive regional data. Every single day TMDB is used in over 180 countries.";
  static const String _advantageFourText =
      "The community is second to none. Between their staff and community moderators, they're always here to help. They're passionate about making sure your experience on TMDB is nothing short of amazing.";
  static const String _advantageFiveText =
      "Trusted platform. Every single day their service is used by millions of people while they process over 3 billion requests. They've proven for years that this is a service that can be trusted and relied on.";

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        RowAdvantages(
          numberAdvantage: _advantageOne,
          textAdvantage: _advantageOneText,
        ),
        RowAdvantages(
          numberAdvantage: _advantageTwo,
          textAdvantage: _advantageTwoText,
        ),
        RowAdvantages(
          numberAdvantage: _advantageThree,
          textAdvantage: _advantageThreeText,
        ),
        RowAdvantages(
          numberAdvantage: _advantageFour,
          textAdvantage: _advantageFourText,
        ),
        RowAdvantages(
          numberAdvantage: _advantageFive,
          textAdvantage: _advantageFiveText,
        ),
      ],
    );
  }
}
