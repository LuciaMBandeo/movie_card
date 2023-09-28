import 'package:flutter/material.dart';

import '../ui_models/movie_preview.dart';
import '../utils/constants.dart';
import '../widgets/row_like_movie.dart';
import '../widgets/row_original_title.dart';
import '../widgets/scrollable_genres.dart';
import '../widgets/sized_box_intro_info.dart';
import '../widgets/text_info.dart';
import '../widgets/text_subtitle.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  static const String routeName = "/movie";

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
        Constants.backgroundColor,
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
              padding: const EdgeInsets.all(Constants.paddingAllExtraInfo),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextSubtitle(Constants.overview),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Constants.paddingBottomOverview),
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
