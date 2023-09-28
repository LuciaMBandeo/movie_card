import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/row_vote_average.dart';
import '../widgets/text_release_date.dart';
import '../widgets/text_title.dart';

class SizedBoxMainInfo extends StatelessWidget {
  final String title;
  final String releaseDate;
  final num voteAverage;

  const SizedBoxMainInfo(
    this.title,
    this.releaseDate,
    this.voteAverage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Constants.paddingTopMainInfo,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * Constants.percentageSizedBox,
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
    );
  }
}
