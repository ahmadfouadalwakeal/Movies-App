import 'package:get_it/get_it.dart';
import 'package:movies_app/core/api/api_services.dart';
import 'package:movies_app/features/home_page/data/data_source/home_remote_source.dart';
import 'package:movies_app/features/home_page/data/repo/trending_home_repo_impl.dart';
import 'package:movies_app/features/home_page/domain/usecase/get_trending_usecase.dart';
import 'package:movies_app/features/home_page/presentation/cubit/home_cubit.dart';
import 'package:movies_app/features/movie_search/data/data_source/movie_search_remote_source.dart';
import 'package:movies_app/features/movie_search/data/repo/movie_search_repo.dart';
import 'package:movies_app/features/movie_search/domain/repo/movie_search_repo.dart';
import 'package:movies_app/features/movie_search/domain/usecase/movie_search_usecase.dart';
import 'package:movies_app/features/movie_search/presentaion/cubit/movie_search_cubit.dart';
import 'package:movies_app/features/movies/data/data_source/movie_remote_source.dart';
import 'package:movies_app/features/movies/data/repo/movies_repo.dart';
import 'package:movies_app/features/movies/domain/repo/movies_repo.dart';
import 'package:movies_app/features/movies/domain/usecase/movies_usecase.dart';
import 'package:movies_app/features/movies/presentaion/cubit/movies_cubit.dart';
import 'package:movies_app/features/tv_series/data/data_source/popular_tv_series_remote_source.dart';
import 'package:movies_app/features/tv_series/data/repo/popular_tv_series_repo.dart';
import 'package:movies_app/features/tv_series/domain/repo/popular_tv_series_repo.dart';
import 'package:movies_app/features/tv_series/domain/usecase/get_popular_tv_series_usecase.dart';
import 'package:movies_app/features/tv_series/presentation/cubit/cubit/tv_cubit.dart';

import '../../features/home_page/domain/repo/trending_home_repo.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  _api();
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
}

void _api() {
  sl.registerLazySingleton<ApiServices>(() => ApiServices());
}

void _dataSources() {
  sl.registerLazySingleton<TrendingHomeRemoteSource>(
      () => TrendingHomeRemoteSourceImpl(sl()));
  sl.registerLazySingleton<TvSeriesRemoteSource>(
      () => TvSeriesRemoteSourceImpl(sl()));
  sl.registerLazySingleton<MovieRemoteSource>(
      () => MovieRemoteSourceImpl(sl()));
  sl.registerLazySingleton<MovieSearchRemoteSource>(
      () => MovieSearchRemoteSourceImpl(sl()));
}

void _repositories() {
  sl.registerLazySingleton<TrendingHomeRepo>(() => TrendingHomeRepoImpl(sl()));
  sl.registerLazySingleton<TvSeriesRepo>(() => TvSeriesRepoImpl(sl()));
  sl.registerLazySingleton<MoviesRepo>(() => MoviesRepoImpl(sl()));
  sl.registerLazySingleton<MovieSearchRepo>(() => MovieSearchRepoImpl(sl()));
}

void _useCase() {
  sl.registerLazySingleton<GetTrendingUseCase>(() => GetTrendingUseCase(sl()));
  sl.registerLazySingleton<GetTvSeriesUseCase>(() => GetTvSeriesUseCase(sl()));
  sl.registerLazySingleton<MoviesUseCase>(() => MoviesUseCase(sl()));
  sl.registerLazySingleton<MovieSearchUseCase>(() => MovieSearchUseCase(sl()));
}

void _cubit() {
  sl.registerLazySingleton<HomeCubit>(
      () => HomeCubit(sl<GetTrendingUseCase>()));
  sl.registerLazySingleton<TvCubit>(() => TvCubit(sl<GetTvSeriesUseCase>()));
  sl.registerLazySingleton<MoviesCubit>(() => MoviesCubit(sl<MoviesUseCase>()));
  sl.registerLazySingleton<MovieSearchCubit>(
      () => MovieSearchCubit(sl<MovieSearchUseCase>()));
}
