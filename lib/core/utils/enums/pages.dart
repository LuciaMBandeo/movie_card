import '../constants/strings.dart';

enum Pages {
  popular(
    0,
    Strings.popularTitle,
  ),
  topRated(
    1,
    Strings.topRatedTitle,
  ),
  nowPlaying(
    2,
    Strings.nowPlayingTitle,
  ),
  upcoming(
    3,
    Strings.upcomingTitle,
  );

  const Pages(
    this.pageIndex,
    this.pageName,
  );

  final int pageIndex;
  final String pageName;
}
