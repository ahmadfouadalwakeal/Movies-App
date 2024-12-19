import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_search/presentaion/cubit/movie_search_cubit.dart';
import 'package:movies_app/features/movies/presentaion/cubit/movies_cubit.dart';

import '../core/di/service_locator.dart';
import '../features/home_page/presentation/cubit/home_cubit.dart';
import '../features/home_page/presentation/screen/home_page.dart';
import '../features/tv_series/presentation/cubit/cubit/tv_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => sl<HomeCubit>()
        ..getTrendingDay()
        ..getTrendingWeek(),
      child: BlocProvider<TvCubit>(
        create: (context) => sl<TvCubit>()..getTvSeries(),
        child: BlocProvider<MoviesCubit>(
          create: (context) => sl<MoviesCubit>()..getMovies(),
          child: BlocProvider<MovieSearchCubit>(
            create: (context) => sl<MovieSearchCubit>(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              title: 'Movies App',
              home: const HomePage(),
            ),
          ),
        ),
      ),
    );
  }
}
