import 'package:flutter/material.dart';

import '../../core/utils/constants/dimens.dart';
import '../../core/utils/constants/strings.dart';
import '../../data/model/movie_preview.dart';
import '../widgets/common_widgets/scrollable_genres.dart';
import '../widgets/movie_details_presentation/row_like_movie.dart';
import '../widgets/movie_details_presentation/row_original_title.dart';
import '../widgets/movie_details_presentation/sized_box_intro_info.dart';
import '../widgets/movie_details_presentation/text_info.dart';
import '../widgets/movie_details_presentation/text_subtitle.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<StatefulWidget> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
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
            Navigator.pop(context);
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
            ScrollableGenres(genres: movie.genres),
            Padding(
              padding: const EdgeInsets.all(Dimens.paddingAllExtraInfo),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextSubtitle(Strings.overview),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimens.paddingBottomOverview),
                    child: TextInfo(movie.movie.overview),
                  ),
                  RowOriginalTitle(movie.movie.originalTitle),
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
