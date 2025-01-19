import 'package:flutter_movie_case/src/data/model/movie_detail_model.dart';

class MovieDetailEntity {
  final String title;
  final String originalTitle;
  final String originalLanguage;
  final String overview;
  final String popularity;
  final String posterPath;
  final String releaseDate;

  MovieDetailEntity({
    required this.title,
    required this.originalTitle,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
  });

  factory MovieDetailEntity.fromMovieDetailModel(MovieDetailModel movie) {
    return MovieDetailEntity(
      title: movie.title.toString(),
      originalTitle: movie.originalTitle.toString(),
      originalLanguage: movie.originalLanguage.toString(),
      overview: movie.overview.toString(),
      popularity: movie.popularity.toString(),
      posterPath: movie.posterPath.toString(),
      releaseDate: movie.releaseDate.toString(),
    );
  }
}
