import '../../../../../core/api/api_failure.dart';
import '../../../data/models/tv_series_model.dart';

sealed class TvState {}

final class TvInitial extends TvState {}

final class TvSeriesLoading extends TvState {}

final class TvSeriesLoaded extends TvState {
  final List<TvModel> popularTvSeriesList;
  final List<TvModel> topRatedTvSeriesList;
  final List<TvModel> onAirTvSeriesList;

  TvSeriesLoaded(
    this.popularTvSeriesList,
    this.topRatedTvSeriesList,
    this.onAirTvSeriesList,
  );
}

final class TvSeriesError extends TvState {
  final Failure failure;

  TvSeriesError(this.failure);
}
