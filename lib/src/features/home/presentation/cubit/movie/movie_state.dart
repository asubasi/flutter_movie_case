part of 'movie_cubit.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  final List<MovieEntity> movies;
  final List<MovieEntity> likedMovies;
  final int likedCount;

  const MovieLoaded(
    this.movies,
    this.likedMovies,
  ) : likedCount = likedMovies.length;

  @override
  List<Object> get props {
    return [
      movies,
      likedMovies,
      likedCount,
    ];
  }

  MovieLoaded copyWith({
    List<MovieEntity>? movies,
    List<MovieEntity>? likedMovies,
  }) {
    return MovieLoaded(
      movies ?? this.movies,
      likedMovies ?? this.likedMovies,
    );
  }
}

final class MovieEmpty extends MovieState {}

final class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);

  @override
  List<Object> get props {
    return [message];
  }
}
