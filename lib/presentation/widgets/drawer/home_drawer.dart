import 'package:flutter/material.dart';

import 'drawer_details.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.white,
      child: DrawerDetails(),
    );
  }
}
