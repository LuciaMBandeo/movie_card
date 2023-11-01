import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';
import '../../../domain/entity/genre_entity.dart';

class ScrollableGenres extends StatelessWidget {
  const ScrollableGenres({
    super.key,
    required this.genres,
  });

  final List<GenreEntity> genres;
  static const _blurRadiusDecoratedBox = 10.0;
  static const _offsetXDecoratedBox = 0.0;
  static const _offsetYDecoratedBox = 10.0;

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
                        _blurRadiusDecoratedBox,
                      ),
                      color: Colors.black26,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: _blurRadiusDecoratedBox,
                          offset: Offset(
                            _offsetXDecoratedBox,
                            _offsetYDecoratedBox,
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
