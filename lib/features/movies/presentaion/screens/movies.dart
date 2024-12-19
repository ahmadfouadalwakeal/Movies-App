import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/movies/presentaion/cubit/movies_cubit.dart';
import 'package:movies_app/features/movies/presentaion/cubit/movies_state.dart';

import '../../../../core/repeated_function.dart/app_slider_list.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.orange,
            ),
          );
        } else if (state is MoviesLoadedState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SliderList(
                  firstListName: state.popularMovies,
                  categoryTitle: 'Popular Now',
                ),
                SliderList(
                  firstListName: state.nowPlayingMovies,
                  categoryTitle: 'Now Playing',
                ),
                SliderList(
                  firstListName: state.topRatedMovies,
                  categoryTitle: 'Top Rated',
                ),
              ],
            ),
          );
        } else if (state is MoviesErrorState) {
          return Center(
            child: Text('Error: ${state.failure.message}'),
          );
        }
        return const Center(
          child: Text('No Data Available'),
        );
      },
    );
  }
}
