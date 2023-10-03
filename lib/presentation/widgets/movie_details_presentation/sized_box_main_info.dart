import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import '../common_widgets/row_vote_average.dart';
import '../common_widgets/text_title.dart';
import 'text_release_date.dart';

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
        top: Dimens.paddingTopMainInfo,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * Dimens.percentageSizedBox,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextTitle(title),
            TextReleaseDate(releaseDate),
            Padding(
              padding: const EdgeInsets.all(
                Dimens.paddingAllIconsRow,
              ),
              child: RowVoteAverage(voteAverage),
            ),
          ],
        ),
      ),
    );
  }
}
