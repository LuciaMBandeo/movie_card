import '../constants/strings.dart';

enum Endpoints {
  popular(
    Strings.popularEndpoint,
  ),
  topRated(
    Strings.topRatedEndpoint,
  ),
  nowPlaying(
    Strings.nowPlayingEndpoint,
  ),
  upcoming(
    Strings.upcomingEndpoint,
  );

  const Endpoints(
    this.endpointName,
  );

  final String endpointName;
}
