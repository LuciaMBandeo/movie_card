import 'package:flutter/material.dart';

import '../../core/utils/enums/pages.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/common_widgets/home_page_app_bar.dart';
import '../widgets/drawer/home_drawer.dart';
import 'now_playing_movies_category.dart';
import 'popular_movies_category.dart';
import 'top_rated_movies_category.dart';
import 'upcoming_movies_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final PageController pageController;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: Pages.values.length,
      vsync: this,
    );
    pageController = PageController();
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  Widget getList(Pages pages, MoviesBloc moviesBloc) {
    switch (pages) {
      case Pages.popular:
        return PopularMoviesCategory(
          moviesBloc: moviesBloc,
        );
      case Pages.topRated:
        return TopRatedMoviesCategory(
          moviesBloc: moviesBloc,
        );
      case Pages.nowPlaying:
        return NowPlayingMoviesCategory(
          moviesBloc: moviesBloc,
        );
      case Pages.upcoming:
        return UpcomingMoviesCategory(
          moviesBloc: moviesBloc,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final moviesBloc = MoviesBloc();
    return Scaffold(
      appBar: HomePageAppBar(
        pageController: pageController,
        tabController: tabController,
      ),
      drawer: const HomeDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: PageView(
          controller: pageController,
          children: [
            for (Pages pages in Pages.values) getList(pages, moviesBloc),
          ],
          onPageChanged: (int index) {
            tabController.animateTo(index);
          },
        ),
      ),
    );
  }
}
