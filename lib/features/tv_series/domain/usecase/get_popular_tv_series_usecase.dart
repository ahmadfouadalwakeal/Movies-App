import 'package:dartz/dartz.dart';
import 'package:movies_app/features/tv_series/data/models/tv_series_model.dart';
import 'package:movies_app/features/tv_series/domain/repo/popular_tv_series_repo.dart';

import '../../../../core/api/api_failure.dart';

class GetTvSeriesUseCase {
  final TvSeriesRepo _tvSeriesRepo;

  GetTvSeriesUseCase(this._tvSeriesRepo);
  Future<Either<Failure, List<TvModel>>> callPopularTvSeries() async {
    return await _tvSeriesRepo.fetchPopularTvSeries();
  }

  Future<Either<Failure, List<TvModel>>> callTopRatedSeries() async {
    return await _tvSeriesRepo.fetchTopRatedTvSeries();
  }

  Future<Either<Failure, List<TvModel>>> callOnAirSeries() async {
    return await _tvSeriesRepo.fetchOnAirTvSeries();
  }
}
