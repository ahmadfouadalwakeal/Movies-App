import 'package:movies_app/core/api/api_failure.dart';
import 'package:movies_app/features/movie_search/data/models/movie_search_model.dart';

sealed class MovieSearchState {}

final class MovieSearchInitial extends MovieSearchState {}

final class ToggleSearchListState extends MovieSearchState {}

final class MovieSearchLoadingState extends MovieSearchState {}

final class MovieSearchLoadedState extends MovieSearchState {
  final List<MovieSearchModel> movieSearchResultList;

  MovieSearchLoadedState(List<MovieSearchModel> movieSearch)
      : movieSearchResultList = movieSearch.length > 20
            ? movieSearch.sublist(0, 20) // الاحتفاظ بأول 20 عنصرًا فقط
            : movieSearch;
}

final class MovieSearchErrorState extends MovieSearchState {
  final Failure failure;

  MovieSearchErrorState(this.failure);
}
