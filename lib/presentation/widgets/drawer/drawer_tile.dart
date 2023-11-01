import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.label,
    required this.route,
  });

  final String label;
  final String route;
  static const double _listTileWidth = 2;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: _listTileWidth,
          color: Colors.grey,
        ),
      ),
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(
          route,
        );
      },
    );
  }
}
