import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/like_button.dart';

class RowLikeMovie extends StatelessWidget {
  const RowLikeMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          Constants.textLikeMovie,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        LikeButton(),
      ],
    );
  }
}
