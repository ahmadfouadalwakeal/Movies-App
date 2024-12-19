import 'package:dartz/dartz.dart';

import '../../../../core/api/api_failure.dart';
import '../../data/models/trending_model.dart';
import '../repo/trending_home_repo.dart';

class GetTrendingUseCase {
  final TrendingHomeRepo trendingHomeRepo;

  GetTrendingUseCase(this.trendingHomeRepo);
  Future<Either<Failure, List<TrendingModel>>> callTrendingWeek() async {
    return await trendingHomeRepo.fetchTrendingWeek();
  }

  Future<Either<Failure, List<TrendingModel>>> callTrendingDay() async {
    return await trendingHomeRepo.fetchTrendingDay();
  }
}
