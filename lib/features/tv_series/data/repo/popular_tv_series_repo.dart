import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/tv_series/data/data_source/popular_tv_series_remote_source.dart';
import 'package:movies_app/features/tv_series/data/models/tv_series_model.dart';
import 'package:movies_app/features/tv_series/domain/repo/popular_tv_series_repo.dart';

class TvSeriesRepoImpl extends TvSeriesRepo {
  final TvSeriesRemoteSource _tvSeriesRemoteSource;

  TvSeriesRepoImpl(this._tvSeriesRemoteSource);
  @override
  Future<Either<Failure, List<TvModel>>> fetchPopularTvSeries() async {
    final response = await _tvSeriesRemoteSource.getPopularTvSeries();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, List<TvModel>>> fetchTopRatedTvSeries() async {
    final response = await _tvSeriesRemoteSource.getTopRatedTvSeries();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, List<TvModel>>> fetchOnAirTvSeries() async {
    final response = await _tvSeriesRemoteSource.getOnAirTvSeries();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }
}
