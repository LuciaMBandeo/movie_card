import 'package:flutter/material.dart';

import '../../core/utils/constants/dimens.dart';
import '../../core/utils/constants/strings.dart';
import '../../data/model/movie_preview.dart';
import '../widgets/common_widgets/scrollable_genres.dart';
import '../widgets/common_widgets/text_info.dart';
import '../widgets/movie_details_presentation_widgets/row_like_movie.dart';
import '../widgets/movie_details_presentation_widgets/row_original_title.dart';
import '../widgets/movie_details_presentation_widgets/sized_box_intro_info.dart';
import '../widgets/movie_details_presentation_widgets/text_subtitle.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  static const _paddingAllExtraInfo = 15.0;
  static const _paddingBottomOverview = 20.0;

  @override
  Widget build(BuildContext context) {
    final MoviePreview movie =
        ModalRoute.of(context)!.settings.arguments as MoviePreview;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(
        Dimens.backgroundColor,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBoxIntroInfo(
              movie.movie.backdropUrl,
              movie.movie.posterUrl,
              movie.movie.title,
              movie.movie.releaseDate,
              movie.movie.voteAverage,
            ),
            ScrollableGenres(
              genres: movie.genres,
            ),
            Padding(
              padding: const EdgeInsets.all(
                _paddingAllExtraInfo,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextSubtitle(
                    Strings.overview,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: _paddingBottomOverview,
                    ),
                    child: TextInfo(
                      movie.movie.overview,
                    ),
                  ),
                  RowOriginalTitle(
                    movie.movie.originalTitle,
                  ),
                  const RowLikeMovie(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
