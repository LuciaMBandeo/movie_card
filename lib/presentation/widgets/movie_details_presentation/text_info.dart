import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

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
        bottom: Dimens.paddingLabel,
      ),
      child: Text(
        info,
        style: const TextStyle(
          fontSize: Dimens.fontSizeInfo,
          color: Colors.white,
        ),
      ),
    );
  }
}
