import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/core/api/api_services.dart';
import 'package:movies_app/features/movie_search/data/models/movie_search_model.dart';

abstract class MovieSearchRemoteSource {
  Future<Either<Failure, List<MovieSearchModel>>> getMovieSearch(String query);
}

class MovieSearchRemoteSourceImpl extends MovieSearchRemoteSource {
  final ApiServices _apiServices;

  MovieSearchRemoteSourceImpl(this._apiServices);
  @override
  Future<Either<Failure, List<MovieSearchModel>>> getMovieSearch(
      String query) async {
    try {
      var result = await _apiServices.moviesSearch(query);
      return Right(result);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(Failure('Unexpected error: $e'));
    }
  }
}
