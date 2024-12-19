import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class TrendingDropdownButton extends StatelessWidget {
  const TrendingDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          height: 45,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: DropdownButton(
              borderRadius: BorderRadius.circular(8),
              autofocus: true,
              underline: Container(height: 0, color: Colors.transparent),
              dropdownColor: Colors.black.withOpacity(0.6),
              icon: const Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.amber,
                size: 30,
              ),
              value: context.read<HomeCubit>().uval,
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: Text(
                    'Weekly',
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text(
                    'Daily',
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                context.read<HomeCubit>().updateTrendingWeek(value!);
              },
            ),
          ),
        );
      },
    );
  }
}
