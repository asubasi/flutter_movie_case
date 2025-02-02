import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_case/src/config/router/app_router.dart';
import 'package:flutter_movie_case/src/config/router/app_router.gr.dart';
import 'package:flutter_movie_case/src/core/components/tile/basic_movie_widget.dart';
import 'package:flutter_movie_case/src/core/constants/app_constants.dart';
import 'package:flutter_movie_case/src/domain/entity/movie_entity.dart';
import 'package:flutter_movie_case/src/features/home/presentation/cubit/movie/movie_cubit.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
    context.read<MovieCubit>().getTopRatedMovie();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_searchController.text.isNotEmpty) {
        context.read<MovieCubit>().searchMovie(_searchController.text);
      } else {
        context.read<MovieCubit>().getTopRatedMovie();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      bloc: GetIt.instance<MovieCubit>(),
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.bookmark),
              onPressed: () {
                router.push(LikedMovieRoute());
              },
            ),
            appBar: AppBar(
              toolbarHeight: 100,
              title: SearchBar(
                hintText: 'Search movie',
                controller: _searchController,
                onSubmitted: (value) {
                  // context.router.push(MovieListRoute(searchQuery: value));
                },
              ),
            ),
            body: switch (state) {
              MovieLoading _ => Center(child: CircularProgressIndicator()),
              MovieLoaded data => ListView.builder(
                  itemCount: data.movies.length,
                  itemBuilder: (context, index) {
                    final movie = data.movies[index];
                    return BasicMovieWidget(
                      movie: movie,
                      isLiked: data.likedMovies.contains(movie),
                    );
                  }),
              _ => Container(),
            });
      },
    );
  }
}
