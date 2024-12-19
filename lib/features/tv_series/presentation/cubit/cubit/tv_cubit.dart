import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/tv_series/domain/usecase/get_popular_tv_series_usecase.dart';

import 'tv_state.dart';

class TvCubit extends Cubit<TvState> {
  final GetTvSeriesUseCase _getTvSeriesUseCase;
  TvCubit(this._getTvSeriesUseCase) : super(TvInitial());
  Future<void> getTvSeries() async {
    try {
      emit(TvSeriesLoading());
      final popularResult = await _getTvSeriesUseCase.callPopularTvSeries();
      final topRatedResult = await _getTvSeriesUseCase.callTopRatedSeries();
      final onAirResult = await _getTvSeriesUseCase.callOnAirSeries();
      // التحقق من وجود أي خطأ
      final failure = popularResult.fold(
            (failure) => failure,
            (success) => null,
          ) ??
          topRatedResult.fold(
            (failure) => failure,
            (success) => null,
          ) ??
          onAirResult.fold(
            (failure) => failure,
            (success) => null,
          );

      if (failure != null) {
        emit(TvSeriesError(failure));
        return;
      }
      final popularTvSeries = popularResult.getOrElse(() => []);
      final topRatedTvSeries = topRatedResult.getOrElse(() => []);
      final onAirTvSeries = onAirResult.getOrElse(() => []);
      emit(TvSeriesLoaded(popularTvSeries, topRatedTvSeries, onAirTvSeries));
    } catch (e) {
      emit(
        TvSeriesError(
          Failure('An error occurred: $e'),
        ),
      );
    }
  }
}
