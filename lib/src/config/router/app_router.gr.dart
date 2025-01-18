// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter_movie_case/src/features/movie_list/presentation/screen/movie_list_screen.dart'
    as _i1;
import 'package:flutter_movie_case/src/features/splash/presentation/screen/splash_screen.dart'
    as _i2;

/// generated route for
/// [_i1.MovieListScreen]
class MovieListRoute extends _i3.PageRouteInfo<void> {
  const MovieListRoute({List<_i3.PageRouteInfo>? children})
    : super(MovieListRoute.name, initialChildren: children);

  static const String name = 'MovieListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.MovieListScreen();
    },
  );
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute({List<_i3.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplashScreen();
    },
  );
}
