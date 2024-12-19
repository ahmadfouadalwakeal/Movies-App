import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/movie_search/data/models/movie_search_model.dart';

abstract class MovieSearchRepo {
  Future<Either<Failure, List<MovieSearchModel>>> fetchMovieSearch(
      String query);
}
