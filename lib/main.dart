import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_case/src/config/router/app_router.dart';
import 'package:flutter_movie_case/src/features/home/presentation/cubit/movie/movie_cubit.dart';
import 'package:get_it/get_it.dart';
import './src/injector.dart' as di;

void main() async {
  await dotenv.load(fileName: ".env");
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.instance<MovieCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Movie App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
