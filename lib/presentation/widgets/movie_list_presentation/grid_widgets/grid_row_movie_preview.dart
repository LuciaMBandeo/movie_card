import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/dimens.dart';
import 'grid_text_title.dart';

class GridRowMoviePreview extends StatelessWidget {
  const GridRowMoviePreview({
    super.key,
    required this.backdrop,
    required this.title,
  });

  final String backdrop;
  final String title;
  static const _paddingGridRow = 8.0;
  static const _widthPercentageBoxDecorationGrid = 0.6;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(
          Radius.circular(
            Dimens.borderRadiusDecoratedBox,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: backdrop,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimens.borderRadiusDecoratedBox,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width *
                        _widthPercentageBoxDecorationGrid,
                    child: Image.network(
                      backdrop,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      _paddingGridRow,
                    ),
                    child: Center(
                      child: GridTextTitle(
                        title,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
