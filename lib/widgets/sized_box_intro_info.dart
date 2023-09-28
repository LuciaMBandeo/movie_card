import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/sized_box_main_info.dart';
import '../widgets/sized_box_poster.dart';

class SizedBoxIntroInfo extends StatelessWidget {
  final String backdrop;
  final String poster;
  final String title;
  final String releaseDate;
  final num voteAverage;

  const SizedBoxIntroInfo(
    this.backdrop,
    this.poster,
    this.title,
    this.releaseDate,
    this.voteAverage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          Constants.heightPercentageSizedBoxStack,
      child: Stack(
        children: [
          Image.network(backdrop),
          Positioned(
            top: Constants.imagePositionTopSizedBox,
            child: Row(
              children: [
                SizedBoxPoster(poster),
                SizedBoxMainInfo(
                  title,
                  releaseDate,
                  voteAverage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
