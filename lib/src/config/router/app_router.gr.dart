// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_movie_case/src/features/home/presentation/screen/home_screen.dart'
    as _i1;
import 'package:flutter_movie_case/src/features/liked_movie/presentation/screen/liked_movie_screen.dart'
    as _i2;
import 'package:flutter_movie_case/src/features/movie_detail/presentation/screen/movie_detail_screen.dart'
    as _i3;
import 'package:flutter_movie_case/src/features/splash/presentation/screen/splash_screen.dart'
    as _i4;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.LikedMovieScreen]
class LikedMovieRoute extends _i5.PageRouteInfo<void> {
  const LikedMovieRoute({List<_i5.PageRouteInfo>? children})
    : super(LikedMovieRoute.name, initialChildren: children);

  static const String name = 'LikedMovieRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.LikedMovieScreen();
    },
  );
}

/// generated route for
/// [_i3.MovieDetailScreen]
class MovieDetailRoute extends _i5.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    _i6.Key? key,
    required String movieId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         MovieDetailRoute.name,
         args: MovieDetailRouteArgs(key: key, movieId: movieId),
         initialChildren: children,
       );

  static const String name = 'MovieDetailRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailRouteArgs>();
      return _i3.MovieDetailScreen(key: args.key, movieId: args.movieId);
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({this.key, required this.movieId});

  final _i6.Key? key;

  final String movieId;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
