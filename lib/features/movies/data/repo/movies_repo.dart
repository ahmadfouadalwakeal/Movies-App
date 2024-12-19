import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/movies/data/data_source/movie_remote_source.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

import '../../domain/repo/movies_repo.dart';

class MoviesRepoImpl extends MoviesRepo {
  final MovieRemoteSource _movieRemoteSource;

  MoviesRepoImpl(this._movieRemoteSource);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchLatestMovies() async {
    final response = await _movieRemoteSource.getLatestMovies();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchNowPlayingMovies() async {
    final response = await _movieRemoteSource.getNowPlayingMovies();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    final response = await _movieRemoteSource.getPopularMovies();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies() async {
    final response = await _movieRemoteSource.getTopRatedMovies();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }
}
