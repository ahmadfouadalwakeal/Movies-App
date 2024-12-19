import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/home_page/data/models/trending_model.dart';

import '../../domain/repo/trending_home_repo.dart';
import '../data_source/home_remote_source.dart';

class TrendingHomeRepoImpl extends TrendingHomeRepo {
  final TrendingHomeRemoteSource remoteSource;

  TrendingHomeRepoImpl(this.remoteSource);

  @override
  Future<Either<Failure, List<TrendingModel>>> fetchTrendingWeek() async {
    final response = await remoteSource.getTrendingWeekListHome();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }

  @override
  Future<Either<Failure, List<TrendingModel>>> fetchTrendingDay() async {
    final response = await remoteSource.getTrendingDayListHome();
    return response.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }
}
