import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movies/domain/repo/movies_repo.dart';

import '../../../../core/api/api_failure.dart';
import '../../data/models/movie_model.dart';

class MoviesUseCase {
  final MoviesRepo _moviesRepo;

  MoviesUseCase(this._moviesRepo);
  Future<Either<Failure, List<MovieModel>>> callPopularMovies() async {
    return await _moviesRepo.fetchPopularMovies();
  }

  Future<Either<Failure, List<MovieModel>>> callNowPlayingMovies() async {
    return await _moviesRepo.fetchNowPlayingMovies();
  }

  Future<Either<Failure, List<MovieModel>>> callTopRatedMovies() async {
    return await _moviesRepo.fetchTopRatedMovies();
  }

  Future<Either<Failure, List<MovieModel>>> callLatestMovies() async {
    return await _moviesRepo.fetchLatestMovies();
  }
}
