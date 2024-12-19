import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_failure.dart';
import '../../domain/usecase/get_trending_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTrendingUseCase getTrendingUseCase;

  // القيمة الافتراضية للقائمة المنسدلة
  int uval = 1;

  HomeCubit(this.getTrendingUseCase) : super(HomeInitial());

  /// تحديث القيمة وإعادة تحميل البيانات بناءً على الاختيار
  void updateTrendingWeek(int value) {
    uval = value;
    emit(TrendingLoading());
    if (value == 1) {
      getTrendingWeek();
    } else if (value == 2) {
      getTrendingDay();
    }
  }

  Future<void> getTrendingDay() async {
    try {
      emit(TrendingLoading());

      final result = await getTrendingUseCase.callTrendingDay();
      result.fold(
        (failure) => emit(TrendingError(failure)),
        (trendingList) => emit(TrendingLoaded(trendingList)),
      );
    } catch (e) {
      emit(TrendingError(Failure('An error occurred: $e')));
    }
  }

  Future<void> getTrendingWeek() async {
    try {
      emit(TrendingLoading());
      final result = await getTrendingUseCase.callTrendingWeek();
      result.fold(
        (failure) => emit(TrendingError(failure)),
        (trendingList) => emit(TrendingLoaded(trendingList)),
      );
    } catch (e) {
      emit(TrendingError(Failure('An error occurred: $e')));
    }
  }
}
