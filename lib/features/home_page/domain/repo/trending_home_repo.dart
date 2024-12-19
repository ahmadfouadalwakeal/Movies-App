import 'package:dartz/dartz.dart';
import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/home_page/data/models/trending_model.dart';

abstract class TrendingHomeRepo {
  Future<Either<Failure, List<TrendingModel>>> fetchTrendingWeek();
  Future<Either<Failure, List<TrendingModel>>> fetchTrendingDay();
}
