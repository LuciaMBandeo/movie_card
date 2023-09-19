import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ContainerGenres extends StatelessWidget {
  final String text;

  const ContainerGenres({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Constants.paddingGenresContainer),
      decoration: BoxDecoration(
        color: Colors.pink,
        border: Border.all(
          color: Colors.deepOrangeAccent,
          width: Constants.borderContainer,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(
          Constants.borderRadiusContainer,
        )),
        shape: BoxShape.rectangle,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: Constants.fontSizeGenres,
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
