import 'package:movies_app/features/home_page/data/models/trending_model.dart';

import '../../../../core/api/api_failure.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class TrendingLoading extends HomeState {}

final class TrendingError extends HomeState {
  final Failure failure;
  TrendingError(this.failure);
}

final class TrendingLoaded extends HomeState {
  final List<TrendingModel> trendingList;
  TrendingLoaded(this.trendingList);
}
