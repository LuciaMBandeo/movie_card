import 'package:flutter/material.dart';

import '../utils/constants.dart';

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
        bottom: Constants.paddingLabel,
      ),
      child: Text(
        subtitle,
        style: const TextStyle(
          fontSize: Constants.fontSizeSubtitle,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
