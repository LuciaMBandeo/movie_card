import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

class SizedBoxPoster extends StatelessWidget {
  final String poster;

  const SizedBoxPoster(
    this.poster, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * Dimens.percentageSizedBox,
      child: FittedBox(
        child: Image.network(poster),
      ),
    );
  }
}
