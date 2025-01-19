import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_case/src/core/network/network_exception.dart';
import 'package:flutter_movie_case/src/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_movie_case/src/data/repository/movie_repository.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_detail_entity.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_result_entity.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<Either<NetworkExceptions, MovieResponsetEntity>> getTopRatedMovie() async {
    try {
      final movies = await _dataSource.getTopRatedMovie();
      return Right(MovieResponsetEntity.fromMovieResultModel(movies));
    } on DioException catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, MovieResponsetEntity>> searchMovie(String query) async {
    try {
      final movies = await _dataSource.searchMovie(query);
      return Right(MovieResponsetEntity.fromMovieResultModel(movies));
    } on DioException catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, MovieDetailEntity>> getMovieDetail(String movieId) async {
    try {
      final movieDetail = await _dataSource.getMovieDetail(movieId);
      return Right(MovieDetailEntity.fromMovieDetailModel(movieDetail));
    } on DioException catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }
}
