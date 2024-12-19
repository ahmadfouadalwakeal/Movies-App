import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

import '../../../../core/api/api_constant.dart';
import '../cubit/home_state.dart';

class HomeCarouseSlider extends StatelessWidget {
  final HomeState state;

  const HomeCarouseSlider({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.orange,
            ),
          );
        }

        if (snapshot.hasData && snapshot.data != ConnectivityResult.none) {
          if (state is TrendingLoaded) {
            final trendingList = (state as TrendingLoaded).trendingList;

            return CarouselSlider(
              items: trendingList.map((movie) {
                return Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3),
                            BlendMode.darken,
                          ),
                          image: NetworkImage(
                            '$baseURLforImages${movie.posterPath}',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                height: MediaQuery.of(context).size.height,
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        } else {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 60,
                  color: Colors.red,
                ),
                SizedBox(height: 16),
                Text(
                  'No Internet Connection',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
