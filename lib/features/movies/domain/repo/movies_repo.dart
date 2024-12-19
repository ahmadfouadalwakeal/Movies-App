import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieModel>>> fetchNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies();
  Future<Either<Failure, List<MovieModel>>> fetchLatestMovies();
}
