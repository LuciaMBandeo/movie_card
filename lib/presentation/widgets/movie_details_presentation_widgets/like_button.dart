import 'package:flutter/material.dart';

import '../../../core/utils/constants/dimens.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButton();
}

class _LikeButton extends State<LikeButton> {
  int _counter = 0;
  bool _isLiked = false;
  static const _paddingElevatedButton = 10.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        _paddingElevatedButton,
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          _handleLikeButtonPressed();
        },
        icon: Icon(
          _isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: Colors.red,
        ),
        label: Text('Likes ($_counter)'),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            Dimens.backgroundColor,
          ),
        ),
      ),
    );
  }

  void _handleLikeButtonPressed() {
    setState(() {
      _counter++;
      _isLiked = true;
    });
  }
}
