import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_case/src/config/router/app_router.dart';
import 'package:flutter_movie_case/src/config/router/app_router.gr.dart';
import 'package:flutter_movie_case/src/core/constants/app_constants.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_entity.dart';
import 'package:flutter_movie_case/src/features/home/presentation/cubit/movie/movie_cubit.dart';

class BasicMovieWidget extends StatelessWidget {
  final MovieEntity movie;
  final bool isLiked;
  const BasicMovieWidget({
    super.key,
    required this.movie,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        router.push(MovieDetailRoute(movieId: movie.id));
      },
      leading: Hero(
        tag: movie.id,
        child: Image.network(
          '${AppConstants.baseImageUrl}${movie.posterPath}',
          width: 100,
          height: 200,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.releaseDate ?? '-'),
      trailing: IconButton(
        icon: isLiked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_outline),
        onPressed: () {
          context.read<MovieCubit>().likeMovie(movie);
        },
      ),
    );
  }
}
