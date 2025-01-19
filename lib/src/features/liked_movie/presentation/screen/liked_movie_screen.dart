import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_case/src/core/components/tile/basic_movie_widget.dart';
import 'package:flutter_movie_case/src/features/home/presentation/cubit/movie/movie_cubit.dart';

@RoutePage()
class LikedMovieScreen extends StatefulWidget {
  const LikedMovieScreen({super.key});

  @override
  State<LikedMovieScreen> createState() => _LikedMovieScreenState();
}

class _LikedMovieScreenState extends State<LikedMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieCubit, MovieState, MovieLoaded>(
      selector: (state) {
        return state as MovieLoaded;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Liked Movie'),
          ),
          body: ListView.builder(
            itemCount: state.likedMovies.length,
            itemBuilder: (context, index) {
              final movie = state.likedMovies[index];
              return BasicMovieWidget(movie: movie);
            },
          ),
        );
      },
    );
  }
}
