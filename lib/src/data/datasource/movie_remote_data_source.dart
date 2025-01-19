import 'package:flutter_movie_case/src/data/model/movie_detail_model.dart';
import 'package:flutter_movie_case/src/data/model/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponseModel> getTopRatedMovie();
  Future<MovieResponseModel> searchMovie(String query);
  Future<MovieDetailModel> getMovieDetail(String movieId);
}
