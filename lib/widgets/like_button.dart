import 'package:flutter/material.dart';

import '../utils/constants.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButton();
}

class _LikeButton extends State<LikeButton> {
  int _counter = 0;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.paddingElevatedButton),
      child: ElevatedButton.icon(
        onPressed: () {
          _handleLikeButtonPressed();
        },
        icon: Icon(
          _isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          color: Colors.red,
        ),
        label: Text('Likes ($_counter)'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[400]),
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
