import 'package:flutter/material.dart';
import 'package:movie_card/data_models/genre.dart';

import '../data_models/movie.dart';
import '../repositories/implementation/genres_repository.dart';
import '../repositories/implementation/movies_repository.dart';
import '../repositories/interfaces/genres_repository_interface.dart';
import '../repositories/interfaces/movies_repository_interface.dart';
import '../ui_models/movie_preview.dart';
import '../widgets/container_movie_preview.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  static const String routeName = "/";

  @override
  State<StatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final MoviesRepositoryInterface moviesRepository = MoviesRepository();
  final GenresRepositoryInterface genresRepository = GenresRepository();
  late final Future<List<MoviePreview>> moviePreview;

  @override
  void initState() {
    moviePreview = getMovieList();
    super.initState();
  }

  Future<List<MoviePreview>> getMovieList() async {
    List<Movie> movies = await moviesRepository.getMovies();
    List<Genre> genres = await genresRepository.getGenres();
    List<MoviePreview> movieList = movies.map((movie) {
      return MoviePreview(movie, genres);
    }).toList();

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<MoviePreview>>(
          future: moviePreview,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<MoviePreview>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error');
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    final payload = snapshot.data![index];
                    return ContainerMoviePreview(payload: payload);
                  },
                );
              } else {
                return const Text("Empty data");
              }
            } else {
              return const Text("other");
            }
          },
        ),
      ),
    );
  }
}
