import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

class TextInfo extends StatelessWidget {

  const TextInfo(
    this.info, {
    super.key,
  });

  final String info;
  static const _fontSizeInfo = 16.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Dimens.paddingLabel,
      ),
      child: Text(
        info,
        style: const TextStyle(
          fontSize: _fontSizeInfo,
          color: Colors.white,
        ),
      ),
    );
  }
}
