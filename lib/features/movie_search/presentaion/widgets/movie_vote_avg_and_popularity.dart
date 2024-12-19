import 'package:flutter/material.dart';
import 'package:movies_app/core/repeated_function.dart/text.dart';

class MovieVoteAvgAndPopularity extends StatelessWidget {
  final dynamic movie;

  const MovieVoteAvgAndPopularity({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildItem(icon: Icons.star, value: movie.voteAverage.toString()),
        const SizedBox(width: 7),
        BuildItem(
            icon: Icons.people_outline_sharp,
            value: movie.popularity.toString()),
      ],
    );
  }
}

class BuildItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const BuildItem({required this.icon, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber, size: 17),
          const SizedBox(width: 5),
          ratingtext(
            value,
          ),
        ],
      ),
    );
  }
}
