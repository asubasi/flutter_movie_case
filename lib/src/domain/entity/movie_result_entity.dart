import 'package:flutter_movie_case/src/data/model/movie_model.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_entity.dart';

class MovieResponsetEntity {
  final int? page;
  final List<MovieEntity>? results;
  final int? totalPages;
  final int? totalResults;

  MovieResponsetEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponsetEntity.fromMovieResultModel(MovieResponseModel movieResult) {
    return MovieResponsetEntity(
      page: movieResult.page,
      results: movieResult.results?.map((e) => MovieEntity.fromMovieModel(e)).toList() ?? [],
      totalPages: movieResult.totalPages,
      totalResults: movieResult.totalResults,
    );
  }
}
