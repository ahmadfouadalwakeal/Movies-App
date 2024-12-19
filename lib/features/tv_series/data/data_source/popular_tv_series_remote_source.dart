import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_services.dart';
import 'package:movies_app/features/tv_series/data/models/tv_series_model.dart';

import '../../../../core/api/api_failure.dart';

abstract class TvSeriesRemoteSource {
  Future<Either<Failure, List<TvModel>>> getPopularTvSeries();
  Future<Either<Failure, List<TvModel>>> getTopRatedTvSeries();
  Future<Either<Failure, List<TvModel>>> getOnAirTvSeries();
}

class TvSeriesRemoteSourceImpl extends TvSeriesRemoteSource {
  final ApiServices _apiServices;

  TvSeriesRemoteSourceImpl(this._apiServices);
  @override
  Future<Either<Failure, List<TvModel>>> getPopularTvSeries() async {
    try {
      var result = await _apiServices.popularTvSeries();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getTopRatedTvSeries() async {
    try {
      var result = await _apiServices.topRatedTvSeries();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<TvModel>>> getOnAirTvSeries() async {
    try {
      var result = await _apiServices.onAirTvSeries();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }
}
