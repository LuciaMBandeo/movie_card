import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.paddingLabel),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: Dimens.fontSizeTitle,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
