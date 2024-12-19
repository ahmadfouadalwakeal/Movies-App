import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/repeated_function.dart/app_text_field.dart';
import 'package:movies_app/core/repeated_function.dart/app_toast.dart';
import 'package:movies_app/features/movie_search/presentaion/cubit/movie_search_cubit.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: AppTextField(
        controller: BlocProvider.of<MovieSearchCubit>(context).searchText,
        hintText: 'Search',
        onSubmitted: (value) => _handleSearchInput(context, value),
        onChanged: (value) => _handleSearchInput(context, value),
        suffixIcon: IconButton(
          onPressed: () {
            showToast('Search Cleared');
            BlocProvider.of<MovieSearchCubit>(context).clearMovieSearch();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.amber.withOpacity(0.6),
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.amber,
        ),
      ),
    );
  }

  void _handleSearchInput(BuildContext context, String value) {
    if (value.isEmpty) {
      BlocProvider.of<MovieSearchCubit>(context).clearMovieSearch();
    } else {
      BlocProvider.of<MovieSearchCubit>(context).getMovieSearch(value);
    }
  }
}
