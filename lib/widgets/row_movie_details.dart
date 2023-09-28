import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/row_vote_average.dart';
import '../widgets/sized_box_poster.dart';
import '../widgets/text_release_date.dart';
import '../widgets/text_title.dart';

class RowMovieDetails extends StatelessWidget {
  final String poster;
  final String title;
  final String releaseDate;
  final num voteAverage;

  const RowMovieDetails({
    super.key,
    required this.poster,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBoxPoster(poster),
        Padding(
          padding: const EdgeInsets.only(top: Constants.paddingTopMainInfo),
          child: SizedBox(
            width: MediaQuery.of(context).size.width *
                Constants.percentageSizedBox,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextTitle(title),
                TextReleaseDate(releaseDate),
                Padding(
                  padding: const EdgeInsets.all(
                    Constants.paddingAllIconsRow,
                  ),
                  child: RowVoteAverage(voteAverage),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
