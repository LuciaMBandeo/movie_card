import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/text_info.dart';
import '../widgets/text_subtitle.dart';

class RowOriginalTitle extends StatelessWidget {
  final String originalTitle;

  const RowOriginalTitle(
    this.originalTitle, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: Constants.paddingLabel),
          child: TextSubtitle(Constants.originalTitle),
        ),
        TextInfo(originalTitle),
      ],
    );
  }
}
