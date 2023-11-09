import 'package:flutter/material.dart';

import '../../core/utils/constants/strings.dart';
import '../../core/utils/enums/endpoints.dart';
import '../../core/utils/resources/data_state.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/movie_list_presentation/grid_widgets/grid_container_movie_preview.dart';

class UpcomingMoviesCategory extends StatefulWidget {
  const UpcomingMoviesCategory({
    super.key,
    required this.moviesBloc,
  });

  final MoviesBloc moviesBloc;

  @override
  State<StatefulWidget> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMoviesCategory> {
  final Endpoints endpoint = Endpoints.upcoming;
  static const int _gridViewChildren = 2;

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
            stream: widget.moviesBloc.upcomingMoviesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data is DataFailure) {
                  return Text(
                    snapshot.data!.error.toString(),
                  );
                } else if (snapshot.data is DataSuccess) {
                  final movieList = snapshot.data?.data ?? [];
                  return GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _gridViewChildren,
                    ),
                    itemCount: movieList.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return GridContainerMoviePreview(
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
