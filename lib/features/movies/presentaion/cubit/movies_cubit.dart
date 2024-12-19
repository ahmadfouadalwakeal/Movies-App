import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies/domain/usecase/movies_usecase.dart';

import '../../../../core/api/api_failure.dart';
import 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesUseCase _moviesUseCase;
  MoviesCubit(this._moviesUseCase) : super(MoviesInitial());

  Future<void> getMovies() async {
    try {
      emit(MoviesLoadingState());
      final popularMoviesResult = await _moviesUseCase.callPopularMovies();
      final topRatedMoviesResult = await _moviesUseCase.callTopRatedMovies();
      final latestMoviesResult = await _moviesUseCase.callLatestMovies();
      final nowPlayingMoviesResult =
          await _moviesUseCase.callNowPlayingMovies();
      // التحقق من وجود أي خطأ
      final failure = popularMoviesResult.fold(
            (failure) => failure,
            (success) => null,
          ) ??
          topRatedMoviesResult.fold(
            (failure) => failure,
            (success) => null,
          ) ??
          latestMoviesResult.fold(
            (failure) => failure,
            (success) => null,
          ) ??
          nowPlayingMoviesResult.fold(
            (failure) => failure,
            (success) => null,
          );

      if (failure != null) {
        emit(MoviesErrorState(failure));
        return;
      }
      final popularMovies = popularMoviesResult.getOrElse(() => []);
      final topRatedMovies = topRatedMoviesResult.getOrElse(() => []);
      final latestMovies = latestMoviesResult.getOrElse(() => []);
      final nowPlayingMovies = nowPlayingMoviesResult.getOrElse(() => []);
      emit(MoviesLoadedState(
          popularMovies, nowPlayingMovies, latestMovies, topRatedMovies));
    } catch (e) {
      emit(
        MoviesErrorState(
          Failure('An error occurred: $e'),
        ),
      );
    }
  }
}
