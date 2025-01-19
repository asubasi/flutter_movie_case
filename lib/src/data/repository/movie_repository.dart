import 'package:dartz/dartz.dart';
import 'package:flutter_movie_case/src/core/network/network_exception.dart';
import 'package:flutter_movie_case/src/data/model/movie_model.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_detail_entity.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_result_entity.dart';

abstract class MovieRepository {
  Future<Either<NetworkExceptions, MovieResponsetEntity>> getTopRatedMovie();
  Future<Either<NetworkExceptions, MovieResponsetEntity>> searchMovie(String query);
  Future<Either<NetworkExceptions, MovieDetailEntity>> getMovieDetail(String movieId);
}
