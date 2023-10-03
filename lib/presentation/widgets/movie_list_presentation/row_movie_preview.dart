import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import '../../../domain/entity/genre.dart';
import '../common_widgets/row_vote_average.dart';
import '../common_widgets/scrollable_genres.dart';
import '../common_widgets/text_title.dart';

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
            Dimens.borderRadiusDecoratedBox,
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
                Dimens.borderRadiusDecoratedBox,
              ),
            ),
            width: MediaQuery.of(context).size.width *
                Dimens.widthPercentageBoxDecoration,
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
