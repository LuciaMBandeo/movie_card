import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TextReleaseDate extends StatelessWidget {
  final String releaseDate;

  const TextReleaseDate(
    this.releaseDate, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Constants.paddingAllTextReleaseDate,
      ),
      child: Text(
        releaseDate,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
