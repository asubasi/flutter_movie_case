import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_case/src/core/network/network_exception.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_entity.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_result_entity.dart';
import 'package:flutter_movie_case/src/domain/usecase/movie_usecase.dart';
import 'package:flutter_movie_case/src/features/home/presentation/cubit/movie/movie_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock classes
class MockMovieUsecase extends Mock implements MovieUsecase {}

void main() {
  late MovieCubit movieCubit;
  late MockMovieUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockMovieUsecase();
    movieCubit = MovieCubit(mockUsecase);
  });

  tearDown(() {
    movieCubit.close();
  });

  group('MovieCubit', () {
    final movie = MovieEntity(
      id: '278',
      title: 'Test Movie',
      posterPath: '',
    );
    final movieList = [movie];

    test('initial state is MovieInitial', () {
      expect(movieCubit.state, equals(MovieInitial()));
    });

    blocTest<MovieCubit, MovieState>(
      'emits [MovieLoading, MovieLoaded] when getTopRatedMovie succeeds',
      build: () {
        when(() => mockUsecase.getTopRatedMovie()).thenAnswer(
          (_) async => Right(MovieResponsetEntity(results: movieList)),
        );
        return movieCubit;
      },
      act: (cubit) => cubit.getTopRatedMovie(),
      expect: () => [
        MovieLoading(),
        MovieLoaded(movieList, []),
      ],
    );

    blocTest<MovieCubit, MovieState>(
      'emits [MovieLoading, MovieError] when getTopRatedMovie fails',
      build: () {
        when(() => mockUsecase.getTopRatedMovie()).thenAnswer(
          (_) async => Left(NetworkExceptions.fromDioError(DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 404,
              statusMessage: 'Error',
            ),
          ))),
        );
        return movieCubit;
      },
      act: (cubit) => cubit.getTopRatedMovie(),
      expect: () => [
        MovieLoading(),
        MovieError('Error'),
      ],
    );

    blocTest<MovieCubit, MovieState>(
      'emits [MovieLoading, MovieEmpty] when getTopRatedMovie returns empty list',
      build: () {
        when(() => mockUsecase.getTopRatedMovie()).thenAnswer(
          (_) async => Right(MovieResponsetEntity(results: [])),
        );
        return movieCubit;
      },
      act: (cubit) => cubit.getTopRatedMovie(),
      expect: () => [
        MovieLoading(),
        MovieEmpty(),
      ],
    );

    blocTest<MovieCubit, MovieState>(
      'emits [MovieLoading, MovieLoaded] when searchMovie succeeds',
      build: () {
        when(() => mockUsecase.searchMovie(any())).thenAnswer(
          (_) async => Right(MovieResponsetEntity(results: movieList)),
        );
        return movieCubit;
      },
      act: (cubit) => cubit.searchMovie('Test'),
      expect: () => [
        MovieLoading(),
        MovieLoaded(movieList, []),
      ],
    );

    blocTest<MovieCubit, MovieState>(
      'does nothing when searchMovie query is less than 3 characters',
      build: () => movieCubit,
      act: (cubit) => cubit.searchMovie('Te'),
      expect: () => [],
    );

    blocTest<MovieCubit, MovieState>(
      'toggles likedMovies when likeMovie is called',
      build: () => movieCubit,
      seed: () => MovieLoaded(movieList, []),
      act: (cubit) => cubit.likeMovie(movie),
      expect: () => [
        MovieLoaded(movieList, [movie]),
      ],
    );

    blocTest<MovieCubit, MovieState>(
      'removes movie from likedMovies when likeMovie is called again',
      build: () => movieCubit,
      seed: () => MovieLoaded(movieList, [movie]),
      act: (cubit) => cubit.likeMovie(movie),
      expect: () => [
        MovieLoaded(
          movieList,
          [],
        ),
      ],
    );
  });
}
