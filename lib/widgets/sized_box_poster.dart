import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SizedBoxPoster extends StatelessWidget {
  final String poster;

  const SizedBoxPoster(
    this.poster, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * Constants.percentageSizedBox,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.network(poster),
      ),
    );
  }
}
