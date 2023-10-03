import 'package:flutter/material.dart';

import '../../../config/router/movie_router.dart';
import '../../../data/model/movie_preview.dart';
import 'row_movie_preview.dart';

class ContainerMoviePreview extends StatelessWidget {
  final MoviePreview payload;

  const ContainerMoviePreview({
    super.key,
    required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.black26,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              MovieRouter.movieDetails,
              arguments: payload,
            );
          },
          child: RowMoviePreview(
            poster: payload.movie.posterUrl,
            title: payload.movie.title,
            genres: payload.genres,
            voteAverage: payload.movie.voteAverage,
          ),
        ),
      ),
    );
  }
}
