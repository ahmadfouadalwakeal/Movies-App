import 'package:flutter/material.dart';

import 'movie_details.dart';
import 'movie_image.dart';

class SearchResultItem extends StatelessWidget {
  final dynamic movie;

  const SearchResultItem({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle navigation to movie details
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: MediaQuery.sizeOf(context).height * .24,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(20, 20, 20, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            MovieImage(posterPath: movie.posterPath),
            const SizedBox(width: 20),
            MovieDetails(movie: movie),
          ],
        ),
      ),
    );
  }
}
