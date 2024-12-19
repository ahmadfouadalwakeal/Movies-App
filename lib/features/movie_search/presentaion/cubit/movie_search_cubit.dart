import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_search/domain/usecase/movie_search_usecase.dart';

import '../../../../core/api/api_failure.dart';
import 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  final MovieSearchUseCase _movieSearchUseCase;
  MovieSearchCubit(this._movieSearchUseCase) : super(MovieSearchInitial());
  final TextEditingController searchText = TextEditingController();
  bool showList = false; // إضافة المتغير هنا

  Future<void> getMovieSearch(String query) async {
    try {
      emit(MovieSearchLoadingState());
      final result = await _movieSearchUseCase.callMovieSearch(query);
      return result.fold(
        (failure) => emit(MovieSearchErrorState(failure)),
        (movieSearch) => emit(MovieSearchLoadedState(movieSearch)),
      );
    } catch (e) {
      emit(MovieSearchErrorState(Failure('An error occurred: $e')));
    }
  }

  // دالة لتغيير قيمة showList
  void toggleShowList() {
    showList = !showList;
    emit(ToggleSearchListState()); // قد تحتاج لتحديث الحالة حسب الحاجة
  }

  void clearMovieSearch() {
    searchText.clear();
    showList = false; // إخفاء القائمة إذا لزم الأمر
    emit(MovieSearchInitial());
  }
}
