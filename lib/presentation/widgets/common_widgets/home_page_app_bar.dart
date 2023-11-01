import 'package:flutter/material.dart';

import '../../../core/utils/constants/strings.dart';

class HomePageAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
    required this.pageController,
    required this.tabController,
  });

  final PageController pageController;
  final TabController tabController;
  static const double _appBarHeight = 130;

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(
        _appBarHeight,
      );
}

class _HomePageAppBarState extends State<HomePageAppBar>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  List<Tab> tabs = [
    const Tab(
      text: Strings.popularTitle,
      icon: Icon(
        Icons.people_alt_outlined,
      ),
    ),
    const Tab(
      text: Strings.topRatedTitle,
      icon: Icon(
        Icons.rate_review_outlined,
      ),
    ),
    const Tab(
      text: Strings.nowPlayingTitle,
      icon: Icon(
        Icons.play_circle_outline,
      ),
    ),
    const Tab(
      text: Strings.upcomingTitle,
      icon: Icon(
        Icons.arrow_circle_up,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: const Text(
        Strings.appTitle,
      ),
      bottom: TabBar(
        controller: widget.tabController,
        tabs: tabs,
        onTap: (int int) {
          try {
            widget.pageController.jumpToPage(
              widget.tabController.index,
            );
          } catch (e) {
            print(Exception(e));
          }
        },
      ),
    );
  }
}
