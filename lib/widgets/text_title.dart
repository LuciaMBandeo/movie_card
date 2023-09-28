import 'package:flutter/material.dart';

import '../utils/constants.dart';

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
        fontSize: Constants.fontSizeTitle,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
