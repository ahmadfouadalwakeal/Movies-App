import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/tv_series/data/models/tv_series_model.dart';

abstract class TvSeriesRepo {
  Future<Either<Failure, List<TvModel>>> fetchPopularTvSeries();
  Future<Either<Failure, List<TvModel>>> fetchTopRatedTvSeries();
  Future<Either<Failure, List<TvModel>>> fetchOnAirTvSeries();
}
