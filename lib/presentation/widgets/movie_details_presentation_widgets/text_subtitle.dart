import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

class TextSubtitle extends StatelessWidget {
  const TextSubtitle(
    this.subtitle, {
    super.key,
  });

  final String subtitle;
  static const _fontSizeSubtitle = 18.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimens.paddingLabel,
      ),
      child: Text(
        subtitle,
        style: const TextStyle(
          fontSize: _fontSizeSubtitle,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
