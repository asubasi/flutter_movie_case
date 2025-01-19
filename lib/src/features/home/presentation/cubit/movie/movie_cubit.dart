import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_entity.dart';
import 'package:flutter_movie_case/src/domain/usecase/movie_usecase.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieUsecase usecase;
  MovieCubit(this.usecase) : super(MovieInitial());

  final List<MovieEntity> likedMovies = [];

  Future<void> getTopRatedMovie() async {
    emit(MovieLoading());
    final result = await usecase.getTopRatedMovie();
    result.fold(
      (l) => emit(MovieError(l.message)),
      (r) {
        if (r.results!.isEmpty) {
          emit(MovieEmpty());
          return;
        } else {
          emit(MovieLoaded(
            r.results!,
            likedMovies,
          ));
        }
      },
    );
  }

  Future<void> searchMovie(String query) async {
    if (query.length < 3) {
      return;
    }
    emit(MovieLoading());
    final result = await usecase.searchMovie(query);
    result.fold(
      (l) => emit(MovieError(l.message)),
      (r) {
        if (r.results!.isEmpty) {
          emit(MovieEmpty());
          return;
        } else {
          emit(MovieLoaded(
            r.results!,
            likedMovies,
          ));
        }
      },
    );
  }

  void likeMovie(MovieEntity movie) {
    if (likedMovies.contains(movie)) {
      likedMovies.remove(movie);
    } else {
      likedMovies.add(movie);
    }
    emit((state as MovieLoaded).copyWith(likedMovies: likedMovies));
  }
}
