import 'package:dio/dio.dart';
import 'package:flutter_movie_case/src/core/constants/url_constants.dart';
import 'package:flutter_movie_case/src/core/network/network_manager.dart';
import 'package:flutter_movie_case/src/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_movie_case/src/data/model/movie_detail_model.dart';
import 'package:flutter_movie_case/src/data/model/movie_model.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final NetworkManager _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<MovieResponseModel> getTopRatedMovie() async {
    try {
      final response = await _client.get(UrlConstants.topRatedMovies);
      return MovieResponseModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResponseModel> searchMovie(String query) async {
    try {
      final response = await _client.get(UrlConstants.searchMovies, queryParameters: {
        'query': query,
      });
      return MovieResponseModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(String movieId) async {
    try {
      final response = await _client.get('${UrlConstants.movieDetail}/$movieId');
      return MovieDetailModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
