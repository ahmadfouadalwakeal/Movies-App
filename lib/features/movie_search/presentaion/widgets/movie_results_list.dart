import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_search/data/models/movie_search_model.dart';

import 'search_result_item.dart';

class SearchResultsList extends StatelessWidget {
  final List<MovieSearchModel> movieSearchResultList;

  const SearchResultsList({required this.movieSearchResultList, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .5,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        itemCount: movieSearchResultList.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return SearchResultItem(movie: movieSearchResultList[index]);
        },
      ),
    );
  }
}
