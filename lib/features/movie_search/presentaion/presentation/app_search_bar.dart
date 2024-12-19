import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_search/presentaion/cubit/movie_search_cubit.dart';
import 'package:movies_app/features/movie_search/presentaion/cubit/movie_search_state.dart';

import '../widgets/movie_results_list.dart';
import '../widgets/search_input_text_field.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSearchCubit, MovieSearchState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            BlocProvider.of<MovieSearchCubit>(context).toggleShowList();
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 30, bottom: 20, right: 10),
            child: Column(
              children: [
                const SearchInputField(),
                const SizedBox(height: 5),
                if (state is MovieSearchLoadingState)
                  const CircularProgressIndicator(color: Colors.orange)
                else if (state is MovieSearchLoadedState)
                  SearchResultsList(
                      movieSearchResultList: state.movieSearchResultList),
              ],
            ),
          ),
        );
      },
    );
  }
}
