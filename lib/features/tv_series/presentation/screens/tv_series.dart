import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/tv_series/presentation/cubit/cubit/tv_cubit.dart';
import 'package:movies_app/features/tv_series/presentation/cubit/cubit/tv_state.dart';

import '../../../../core/repeated_function.dart/app_slider_list.dart';

class TvSeries extends StatelessWidget {
  const TvSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvCubit, TvState>(
      builder: (context, state) {
        if (state is TvSeriesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.orange,
            ),
          );
        } else if (state is TvSeriesLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SliderList(
                  firstListName: state.popularTvSeriesList,
                  categoryTitle: 'Popular Now',
                ),
                SliderList(
                  firstListName: state.onAirTvSeriesList,
                  categoryTitle: 'ON Air Now',
                ),
                SliderList(
                  firstListName: state.topRatedTvSeriesList,
                  categoryTitle: 'Top Rated',
                ),
              ],
            ),
          );
        } else if (state is TvSeriesError) {
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
