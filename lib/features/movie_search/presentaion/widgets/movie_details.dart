import 'package:flutter/material.dart';
import 'package:movies_app/core/repeated_function.dart/text.dart';
import 'package:movies_app/features/movie_search/presentaion/widgets/movie_vote_avg_and_popularity.dart';

class MovieDetails extends StatelessWidget {
  final dynamic movie;

  const MovieDetails({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            tittleText(
              movie.mediaType,
            ),
            MovieVoteAvgAndPopularity(movie: movie),
            Text(
              movie.overView,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
