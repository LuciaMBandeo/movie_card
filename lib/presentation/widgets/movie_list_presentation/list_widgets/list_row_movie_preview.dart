import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/dimens.dart';
import '../../../../domain/entity/genre_entity.dart';
import '../../common_widgets/row_vote_average.dart';
import '../../common_widgets/scrollable_genres.dart';
import '../../common_widgets/text_title.dart';

class ListRowMoviePreview extends StatelessWidget {
  const ListRowMoviePreview({
    super.key,
    required this.poster,
    required this.title,
    required this.genres,
    required this.voteAverage,
  });

  final String poster;
  final String title;
  final List<GenreEntity> genres;
  final num voteAverage;
  static const _widthPercentageBoxDecorationList = 0.3;

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
          CachedNetworkImage(
            imageUrl: poster,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimens.borderRadiusDecoratedBox,
                ),
              ),
              width: MediaQuery.of(context).size.width *
                  _widthPercentageBoxDecorationList,
              child: Image.network(
                poster,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextTitle(title),
                RowVoteAverage(voteAverage),
                ScrollableGenres(genres: genres),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
