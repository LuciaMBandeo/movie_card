import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import 'sized_box_main_info.dart';
import 'sized_box_poster.dart';

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
          Dimens.heightPercentageSizedBoxStack,
      child: Stack(
        children: [
          Image.network(backdrop),
          Positioned(
            top: Dimens.imagePositionTopSizedBox,
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
