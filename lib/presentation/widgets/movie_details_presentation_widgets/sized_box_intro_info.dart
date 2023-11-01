import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'sized_box_main_info.dart';
import 'sized_box_poster.dart';

class SizedBoxIntroInfo extends StatelessWidget {
  const SizedBoxIntroInfo(
    this.backdrop,
    this.poster,
    this.title,
    this.releaseDate,
    this.voteAverage, {
    super.key,
  });

  final String backdrop;
  final String poster;
  final String title;
  final String releaseDate;
  final num voteAverage;
  static const _heightPercentageSizedBoxStack = 0.53;
  static const _imagePositionTopSizedBox = 170.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * _heightPercentageSizedBoxStack,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: backdrop,
          ),
          Positioned(
            top: _imagePositionTopSizedBox,
            child: Row(
              children: [
                SizedBoxPoster(
                  poster,
                ),
                SizedBoxMainInfo(
                  title,
                  releaseDate,
                  voteAverage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
