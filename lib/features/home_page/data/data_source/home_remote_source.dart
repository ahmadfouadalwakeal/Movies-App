import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_services.dart';
import 'package:movies_app/features/home_page/data/models/trending_model.dart';

import '../../../../core/api/api_failure.dart';

abstract class TrendingHomeRemoteSource {
  Future<Either<Failure, List<TrendingModel>>> getTrendingWeekListHome();
  Future<Either<Failure, List<TrendingModel>>> getTrendingDayListHome();
}

class TrendingHomeRemoteSourceImpl extends TrendingHomeRemoteSource {
  final ApiServices apiServices;

  TrendingHomeRemoteSourceImpl(this.apiServices);

  @override
  Future<Either<Failure, List<TrendingModel>>> getTrendingWeekListHome() async {
    try {
      final result =
          await apiServices.trendingWeekListHome(); // Call the API service
      return Right(result); // Return the result as a success
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<TrendingModel>>> getTrendingDayListHome() async {
    try {
      final result =
          await apiServices.trendingDayListHome(); // Call the API service
      return Right(result); // Return the result as a success
    } catch (e) {
      return Left(
        Failure(e.toString()),
      );
    }
  }
}
