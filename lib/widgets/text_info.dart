import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TextInfo extends StatelessWidget {
  final String info;

  const TextInfo(
    this.info, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Constants.paddingLabel,
      ),
      child: Text(
        info,
        style: const TextStyle(
          fontSize: Constants.fontSizeInfo,
          color: Colors.white,
        ),
      ),
    );
  }
}
