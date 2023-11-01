import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import '../common_widgets/row_vote_average.dart';
import '../common_widgets/text_title.dart';
import 'text_release_date.dart';

class SizedBoxMainInfo extends StatelessWidget {
  const SizedBoxMainInfo(
    this.title,
    this.releaseDate,
    this.voteAverage, {
    super.key,
  });

  final String title;
  final String releaseDate;
  final num voteAverage;
  static const _paddingTopMainInfo = 40.0;
  static const _paddingAllIconsRow = 4.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: _paddingTopMainInfo,
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
                _paddingAllIconsRow,
              ),
              child: RowVoteAverage(voteAverage),
            ),
          ],
        ),
      ),
    );
  }
}
