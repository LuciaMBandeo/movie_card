import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

class SizedBoxPoster extends StatelessWidget {
  const SizedBoxPoster(
    this.poster, {
    super.key,
  });

  final String poster;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * Dimens.percentageSizedBox,
      child: CachedNetworkImage(
        imageUrl: poster,
      ),
    );
  }
}
