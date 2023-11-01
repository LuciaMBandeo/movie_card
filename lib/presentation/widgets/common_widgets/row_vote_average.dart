import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import 'row_stars.dart';

class RowVoteAverage extends StatelessWidget {
  const RowVoteAverage(
    this.voteAverage, {
    super.key,
  });

  final num voteAverage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Dimens.paddingLabel,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StarsRow(voteAverage),
          Padding(
            padding: const EdgeInsets.all(
              Dimens.paddingRow,
            ),
            child: Text(
              "($voteAverage)",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
