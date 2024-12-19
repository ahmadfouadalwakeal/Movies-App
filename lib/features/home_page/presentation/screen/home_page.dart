import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/features/home_page/presentation/cubit/home_cubit.dart';
import 'package:movies_app/features/home_page/presentation/cubit/home_state.dart';
import 'package:movies_app/features/movies/presentaion/screens/movies.dart';
import 'package:movies_app/features/tv_series/presentation/screens/tv_series.dart';
import 'package:movies_app/features/tv_series/presentation/screens/up_coming_.dart';

import '../../../movie_search/presentaion/presentation/app_search_bar.dart';
import '../widgets/home_carouse_slider.dart';
import '../widgets/trending_drop_down_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  toolbarHeight: MediaQuery.sizeOf(context).height * 0.12,
                  pinned: true,
                  expandedHeight: MediaQuery.sizeOf(context).height * 0.5,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: state is TrendingLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.orange,
                            ),
                          )
                        : state is TrendingLoaded
                            ? HomeCarouseSlider(
                                state: state,
                              )
                            : const Center(
                                child: Text('No internet connection'),
                              ),
                  ),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.trending + AppStrings.trendingEmoji,
                          style: TextStyle(
                            color: AppColors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const TrendingDropdownButton(),
                      ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const Center(
                        child: AppSearchBar(),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .07,
                        width: MediaQuery.sizeOf(context).width,
                        child: TabBar(
                          physics: const BouncingScrollPhysics(),
                          indicatorWeight: 0,
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 16), // تقليل المسافة بين التابات
                          isScrollable: false,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.orange.withOpacity(.7),
                          ),
                          tabs: const [
                            Tab(text: 'Tv Series'),
                            Tab(text: 'Movies'),
                            Tab(text: 'UpComing'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .7,
                        child: const TabBarView(
                          children: [
                            TvSeries(),
                            Movies(),
                            UpComing(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
