import 'package:flutter/material.dart';

import '../../core/utils/constants/strings.dart';
import '../../core/utils/enums/endpoints.dart';
import '../../core/utils/resources/data_state.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/movie_list_presentation/list_widgets/list_container_movie_preview.dart';

class NowPlayingMoviesCategory extends StatefulWidget {
  const NowPlayingMoviesCategory({
    super.key,
    required this.moviesBloc,
  });

  final MoviesBloc moviesBloc;

  @override
  State<StatefulWidget> createState() => _NowPLayingMoviesState();
}

class _NowPLayingMoviesState extends State<NowPlayingMoviesCategory> {
  final Endpoints endpoint = Endpoints.nowPlaying;

  @override
  void initState() {
    super.initState();
    widget.moviesBloc.fetchEndpointsMovies(
      endpoint,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: widget.moviesBloc.nowPlayingMoviesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data is DataFailure) {
                return Text(snapshot.data!.error.toString());
              } else if (snapshot.data is DataSuccess) {
                return ListView.builder(
                  itemCount: snapshot.data?.data?.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    if (snapshot.data?.data?[index] == null) {
                      return const Text(Strings.errorMovieNotFound);
                    } else {
                      return ListContainerMoviePreview(
                        movie: snapshot.data!.data![index],
                      );
                    }
                  },
                );
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
