import 'package:flutter/material.dart';

import '../data_models/genre.dart';
import '../utils/constants.dart';
import '../widgets/row_vote_average.dart';
import '../widgets/scrollable_genres.dart';
import '../widgets/text_title.dart';

class RowMoviePreview extends StatelessWidget {
  final String poster;
  final String title;
  final List<Genre> genres;
  final num voteAverage;

  const RowMoviePreview({
    super.key,
    required this.poster,
    required this.title,
    required this.genres,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(
          Radius.circular(
            Constants.borderRadiusDecoratedBox,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Constants.borderRadiusDecoratedBox,
              ),
            ),
            width: MediaQuery.of(context).size.width *
                Constants.widthPercentageBoxDecoration,
            child: Image.network(
              poster,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextTitle(title),
                RowVoteAverage(voteAverage),
                ScrollableGenres(genres: genres),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
