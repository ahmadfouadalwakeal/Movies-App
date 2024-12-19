import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/movie_search/data/data_source/movie_search_remote_source.dart';
import 'package:movies_app/features/movie_search/data/models/movie_search_model.dart';

import '../../domain/repo/movie_search_repo.dart';

class MovieSearchRepoImpl extends MovieSearchRepo {
  final MovieSearchRemoteSource _movieSearchRemoteSource;

  MovieSearchRepoImpl(this._movieSearchRemoteSource);
  @override
  Future<Either<Failure, List<MovieSearchModel>>> fetchMovieSearch(
      String query) async {
    final response = await _movieSearchRemoteSource.getMovieSearch(query);
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }
}
