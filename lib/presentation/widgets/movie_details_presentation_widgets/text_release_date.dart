import 'package:flutter/material.dart';

class TextReleaseDate extends StatelessWidget {
  const TextReleaseDate(
    this.releaseDate, {
    super.key,
  });

  final String releaseDate;
  static const _paddingAllTextReleaseDate = 10.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        _paddingAllTextReleaseDate,
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
