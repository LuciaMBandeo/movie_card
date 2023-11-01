import 'package:flutter/material.dart';

import '../../../core/utils/constants/strings.dart';
import 'like_button.dart';

class RowLikeMovie extends StatelessWidget {
  const RowLikeMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            Strings.textLikeMovie,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        LikeButton(),
      ],
    );
  }
}
