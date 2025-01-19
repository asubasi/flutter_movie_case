import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_case/src/features/movie_detail/presentation/cubit/movie_detail/movie_detail_cubit.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class MovieDetailScreen extends StatefulWidget {
  final String movieId;
  const MovieDetailScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final MovieDetailCubit _movieDetailCubit = MovieDetailCubit(GetIt.instance());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      bloc: _movieDetailCubit..getMovieDetail(widget.movieId),
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: switch (state) {
                MovieDetailLoading _ => Text('Loading...'),
                MovieDetailError _ => Text('Error'),
                MovieDetailLoaded movie => Text(movie.movieDetail.title),
                _ => Text('Movie Detail'),
              },
            ),
            body: switch (state) {
              MovieDetailLoading _ => CircularProgressIndicator(),
              MovieDetailError _ => Text('Error'),
              MovieDetailLoaded movie => SafeArea(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    children: [
                      Hero(
                        tag: widget.movieId,
                        child: Image.network('https://image.tmdb.org/t/p/w500${movie.movieDetail.posterPath}'),
                      ),
                      Text(
                        movie.movieDetail.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        movie.movieDetail.overview,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Release Date: ${movie.movieDetail.releaseDate}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Rating: ${movie.movieDetail.popularity}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Languafe: ${movie.movieDetail.originalLanguage}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              _ => Text('Movie Detail'),
            });
      },
    );
  }
}
