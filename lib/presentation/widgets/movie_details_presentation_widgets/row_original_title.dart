import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import '../../../core/utils/constants/strings.dart';
import '../common_widgets/text_info.dart';
import 'text_subtitle.dart';

class RowOriginalTitle extends StatelessWidget {
  const RowOriginalTitle(
    this.originalTitle, {
    super.key,
  });

  final String originalTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            right: Dimens.paddingLabel,
          ),
          child: TextSubtitle(
            Strings.originalTitle,
          ),
        ),
        TextInfo(originalTitle),
      ],
    );
  }
}
