import 'package:flutter/material.dart';

import '../../data/model/movie_preview.dart';
import '../../data/repository/implementation/genres_repository.dart';
import '../../data/repository/implementation/movies_repository.dart';
import '../../domain/entity/genre.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/interfaces/i_genres_repository.dart';
import '../../domain/repository/interfaces/i_movies_repository.dart';
import '../widgets/movie_list_presentation/container_movie_preview.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<StatefulWidget> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final IMoviesRepository moviesRepository = MoviesRepository();
  final IGenresRepository genresRepository = GenresRepository();
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
