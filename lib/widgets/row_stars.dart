import 'package:flutter/material.dart';

class StarsRow extends StatelessWidget {
  final num voteAverage;
  static const voteAverageIcon = Icons.star;

  const StarsRow(
    this.voteAverage, {
    super.key,
  });

  List<Widget> _starsView() {
    int fullStar = (voteAverage / 2).floor();
    double halfFilledStar = (voteAverage / 2) - fullStar;
    List<Widget> stars = [];
    for (int i = 1; i <= fullStar; i++) {
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
    stars.add(
      ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: const [
              Colors.yellow,
              Colors.transparent,
            ],
            stops: [
              halfFilledOpacity,
              1,
            ],
          ).createShader(bounds);
        },
        child: const Icon(
          voteAverageIcon,
        ),
      ),
    );
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _starsView(),
    );
  }
}
