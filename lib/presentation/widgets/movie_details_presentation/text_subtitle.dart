import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

class TextSubtitle extends StatelessWidget {
  final String subtitle;

  const TextSubtitle(
    this.subtitle, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimens.paddingLabel,
      ),
      child: Text(
        subtitle,
        style: const TextStyle(
          fontSize: Dimens.fontSizeSubtitle,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
