import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoadingState extends MoviesState {}

final class MoviesLoadedState extends MoviesState {
  final List<MovieModel> popularMovies;
  final List<MovieModel> nowPlayingMovies;
  final List<MovieModel> latestMovies;
  final List<MovieModel> topRatedMovies;

  MoviesLoadedState(
    this.popularMovies,
    this.nowPlayingMovies,
    this.latestMovies,
    this.topRatedMovies,
  );
}

final class MoviesErrorState extends MoviesState {
  final Failure failure;

  MoviesErrorState(this.failure);
}
