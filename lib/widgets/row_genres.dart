import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'container_genres.dart';

class GenresRow extends StatelessWidget {
  final List<String> genresList;

  const GenresRow({
    super.key,
    required this.genresList,
  });

  @override
  Widget build(BuildContext context) {
    //TODO implement the mapping for the genres
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContainerGenres(
          text: Constants.genreAnimation,
        ),
        ContainerGenres(
          text: Constants.genreFamily,
        ),
        ContainerGenres(
          text: Constants.genreAdventure,
        ),
        ContainerGenres(
          text: Constants.genreFantasy,
        ),
        ContainerGenres(
          text: Constants.genreComedy,
        ),
      ],
    );
  }
}
