import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/core/api/api_services.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

abstract class MovieRemoteSource {
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieModel>>> getLatestMovies();
}

class MovieRemoteSourceImpl extends MovieRemoteSource {
  final ApiServices _apiServices;

  MovieRemoteSourceImpl(this._apiServices);

  @override
  Future<Either<Failure, List<MovieModel>>> getLatestMovies() async {
    try {
      var result = await _apiServices.latestMovies();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      var result = await _apiServices.nowPlayingMovies();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    try {
      var result = await _apiServices.topRatedMovies();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      var result = await _apiServices.popularMovies();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }
}
