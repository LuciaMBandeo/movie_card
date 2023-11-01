import 'movie_model.dart';

class ResultModel {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  ResultModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory ResultModel.fromJson(Map<String, dynamic> result) {
    List<MovieModel> movieList = (result['results'] as List<dynamic>).map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>)).toList();
    return ResultModel(
      page: result['page'],
      results: movieList,
      totalPages: result['total_pages'],
      totalResults: result['total_results'],
    );
  }
}
