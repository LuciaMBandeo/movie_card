import 'package:flutter/material.dart';

import '../../core/utils/constants/strings.dart';
import '../../core/utils/enums/endpoints.dart';
import '../../core/utils/resources/data_state.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/movie_list_presentation/list_widgets/list_container_movie_preview.dart';

class TopRatedMoviesCategory extends StatefulWidget {
  const TopRatedMoviesCategory({
    super.key,
    required this.moviesBloc,
  });

  final MoviesBloc moviesBloc;

  @override
  State<StatefulWidget> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMoviesCategory> {
  final Endpoints endpoint = Endpoints.topRated;

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
        child: RefreshIndicator(
          onRefresh: () {
            return widget.moviesBloc.fetchEndpointsMovies(
              endpoint,
            );
          },
          child: StreamBuilder(
            stream: widget.moviesBloc.topRatedMoviesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data is DataFailure) {
                  return Text(
                    snapshot.data!.error.toString(),
                  );
                } else if (snapshot.data is DataSuccess) {
                  final movieList = snapshot.data?.data ?? [];
                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: movieList.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return ListContainerMoviePreview(
                        movie: movieList[index],
                      );
                    },
                  );
                } else if (snapshot.data is DataEmpty) {
                  return Column(
                    children: [
                      Image.asset(
                        Strings.noMoviesFoundImagePath,
                      ),
                      const Text(Strings.errorMovieNotFound),
                    ],
                  );
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
