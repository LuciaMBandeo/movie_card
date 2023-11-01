import 'package:flutter/material.dart';

import '../../../../config/router/movie_router.dart';
import '../../../../data/model/movie_preview.dart';
import 'grid_row_movie_preview.dart';

class GridContainerMoviePreview extends StatelessWidget {
  const GridContainerMoviePreview({
    super.key,
    required this.movie,
  });

  final MoviePreview movie;

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
              arguments: movie,
            );
          },
          child: GridRowMoviePreview(
            backdrop: movie.movie.backdropUrl,
            title: movie.movie.title,
          ),
        ),
      ),
    );
  }
}
