import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

class TextTitle extends StatelessWidget {
  final String title;

  const TextTitle(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: Dimens.fontSizeTitle,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
