import 'package:flutter_movie_case/src/data/model/movie_model.dart';

class MovieEntity {
  final String title;
  final String posterPath;
  final String? releaseDate;
  final String id;

  MovieEntity({
    required this.title,
    required this.posterPath,
    this.releaseDate,
    required this.id,
  });

  factory MovieEntity.fromMovieModel(MovieModel movie) {
    return MovieEntity(
      title: movie.title ?? '',
      posterPath: movie.posterPath ?? '',
      releaseDate: movie.releaseDate,
      id: movie.id.toString(),
    );
  }
}
