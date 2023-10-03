import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import '../../../domain/entity/genre.dart';

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
        Dimens.paddingRow,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: genres
              .map(
                (genre) => Padding(
                  padding: const EdgeInsets.all(
                    Dimens.paddingLabel,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimens.borderRadiusDecoratedBox,
                      ),
                      color: Colors.black26,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: Dimens.blurRadiusDecoratedBox,
                          offset: Offset(
                            Dimens.offsetXDecoratedBox,
                            Dimens.offsetYDecoratedBox,
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
