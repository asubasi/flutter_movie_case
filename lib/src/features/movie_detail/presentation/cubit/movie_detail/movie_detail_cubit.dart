import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_detail_entity.dart';
import 'package:flutter_movie_case/src/domain/usecase/movie_usecase.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final MovieUsecase usecase;
  MovieDetailCubit(this.usecase) : super(MovieDetailInitial());

  Future<void> getMovieDetail(String movieId) async {
    emit(MovieDetailLoading());
    final result = await usecase.getMovieDetail(movieId);
    result.fold(
      (l) => emit(MovieDetailError(l.message)),
      (r) {
        emit(MovieDetailLoaded(r));
      },
    );
  }
}
