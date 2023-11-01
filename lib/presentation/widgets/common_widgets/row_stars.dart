import 'package:flutter/material.dart';

class StarsRow extends StatelessWidget {
  const StarsRow(
    this.voteAverage, {
    super.key,
  });

  final num voteAverage;
  static const voteAverageIcon = Icons.star;
  static const int _maxStars = 5;
  static const int _divideInHalf = 2;
  static const double _gradientStop = 1;

  List<Widget> _starsView() {
    int fullStar = (voteAverage / _divideInHalf).floor(); //1
    double halfFilledStar = (voteAverage / _divideInHalf) - fullStar; //0.75
    List<Widget> stars = [];
    for (int i = 0; i < fullStar; i++) {
      stars.add(
        const Icon(
          voteAverageIcon,
          color: Colors.yellow,
        ),
      );
    }
    double halfFilledOpacity = 0;
    switch (halfFilledStar) {
      case >= 0 && <= 0.15:
        halfFilledOpacity = 0;
        break;
      case > 0.15 && <= 0.35:
        halfFilledOpacity = 0.15;
        break;
      case > 0.35 && <= 0.65:
        halfFilledOpacity = 0.45;
        break;
      case > 0.65:
        halfFilledOpacity = 0.6;
    }
    if (fullStar != _maxStars) {
      int emptyStars = _maxStars - fullStar - halfFilledStar.ceil(); //5-1-1
      stars.add(
        ShaderMask(
          shaderCallback: (
            Rect bounds,
          ) {
            return LinearGradient(
              colors: const [
                Colors.yellow,
                Colors.transparent,
              ],
              stops: [
                halfFilledOpacity,
                _gradientStop,
              ],
            ).createShader(
              bounds,
            );
          },
          blendMode: BlendMode.srcIn,
          child: const Icon(
            voteAverageIcon,
          ),
        ),
      );
      for (int i = 0; i < emptyStars; i++) {
        stars.add(
          const Icon(
            voteAverageIcon,
          ),
        );
      }
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _starsView(),
    );
  }
}
