import 'package:dartz/dartz.dart';
import 'package:flutter_movie_case/src/core/network/network_exception.dart';
import 'package:flutter_movie_case/src/data/repository/movie_repository.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_detail_entity.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_result_entity.dart';

class MovieUsecase {
  final MovieRepository _repository;

  MovieUsecase(this._repository);

  Future<Either<NetworkExceptions, MovieResponsetEntity>> getTopRatedMovie() async {
    final result = await _repository.getTopRatedMovie();
    return result;
  }

  Future<Either<NetworkExceptions, MovieResponsetEntity>> searchMovie(String query) async {
    final result = await _repository.searchMovie(query);
    return result;
  }

  Future<Either<NetworkExceptions, MovieDetailEntity>> getMovieDetail(String movieId) async {
    final result = await _repository.getMovieDetail(movieId);
    return result;
  }
}
