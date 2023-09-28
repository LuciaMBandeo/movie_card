import 'package:flutter/material.dart';
import 'package:movie_card/data_models/genre.dart';

import '../utils/constants.dart';

class ScrollableGenres extends StatelessWidget {
  const ScrollableGenres({
    super.key,
    required this.genres,
  });

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Constants.paddingRow,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: genres
              .map(
                (genre) => Padding(
                  padding: const EdgeInsets.all(
                    Constants.paddingLabel,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Constants.borderRadiusDecoratedBox,
                      ),
                      color: Colors.black26,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: Constants.blurRadiusDecoratedBox,
                          offset: Offset(
                            Constants.offsetXDecoratedBox,
                            Constants.offsetYDecoratedBox,
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      genre.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
