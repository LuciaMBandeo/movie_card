import 'package:flutter/material.dart';

class StarsRow extends StatelessWidget {
  const StarsRow({
    super.key,
    // TODO implement logic for the stars
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_half_rounded,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_border_rounded,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
