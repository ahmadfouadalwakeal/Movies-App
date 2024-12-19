import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_search/data/models/movie_search_model.dart';
import 'package:movies_app/features/movie_search/domain/repo/movie_search_repo.dart';

import '../../../../core/api/api_failure.dart';

class MovieSearchUseCase {
  final MovieSearchRepo _movieSearchRepo;

  MovieSearchUseCase(this._movieSearchRepo);
  Future<Either<Failure, List<MovieSearchModel>>> callMovieSearch(
      String query) async {
    return await _movieSearchRepo.fetchMovieSearch(query);
  }
}
