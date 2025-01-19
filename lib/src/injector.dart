import 'package:dio/dio.dart';
import 'package:flutter_movie_case/src/core/network/network_manager.dart';
import 'package:flutter_movie_case/src/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_movie_case/src/data/datasource/movie_remote_data_source_impl.dart';
import 'package:flutter_movie_case/src/data/repository/movie_repository.dart';
import 'package:flutter_movie_case/src/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_case/src/domain/usecase/movie_usecase.dart';
import 'package:flutter_movie_case/src/features/home/presentation/cubit/movie/movie_cubit.dart';

import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void init() {
  injector
    ..registerLazySingleton(() => Dio())
    ..registerLazySingleton(() => NetworkManager(injector()))
    ..registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(injector()))
    ..registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(injector()))
    ..registerLazySingleton<MovieUsecase>(() => MovieUsecase(injector()))
    ..registerLazySingleton<MovieCubit>(() => MovieCubit(injector()));
}
