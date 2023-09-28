import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/row_stars.dart';

class RowVoteAverage extends StatelessWidget {
  final num voteAverage;

  const RowVoteAverage(
    this.voteAverage, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Constants.paddingLabel,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StarsRow(voteAverage),
          Padding(
            padding: const EdgeInsets.all(
              Constants.paddingRow,
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
