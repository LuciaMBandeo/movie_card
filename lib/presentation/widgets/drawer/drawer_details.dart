import 'package:flutter/material.dart';

import '../../../config/router/movie_router.dart';
import '../../../core/utils/constants/strings.dart';
import 'drawer_tile.dart';

class DrawerDetails extends StatelessWidget {
  const DrawerDetails({super.key});

  static const String _homeTile = "Home";
  static const String _aboutTheAppTile = "About the app";
  static const double _dividerThickness = 3;
  static const double _headerFontSize = 30;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DrawerHeader(
          child: Center(
            child: Text(
              Strings.appTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: _headerFontSize,
              ),
            ),
          ),
        ),
        Divider(
          thickness: _dividerThickness,
          color: Colors.white,
        ),
        DrawerTile(
          label: _homeTile,
          route: NamedRoutes.homePage,
        ),
        DrawerTile(
          label: _aboutTheAppTile,
          route: NamedRoutes.aboutTheApp,
        ),
      ],
    );
  }
}
