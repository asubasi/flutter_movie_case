import 'package:auto_route/auto_route.dart';
import 'package:flutter_movie_case/src/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: MovieListRoute.page),
      ];
}

final router = AppRouter();
