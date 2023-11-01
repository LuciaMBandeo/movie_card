import 'package:flutter/material.dart';

import '../../../../core/utils/constants/dimens.dart';

class GridTextTitle extends StatelessWidget {
  const GridTextTitle(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: Dimens.fontSizeTitle,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
