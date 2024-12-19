import 'package:flutter/material.dart';

import '../api/api_constant.dart';

class SliderList extends StatelessWidget {
  final List firstListName;
  final String categoryTitle;

  const SliderList({
    super.key,
    required this.firstListName,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 15, bottom: 20),
          child: Text(categoryTitle),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.35,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: firstListName.length,
            itemBuilder: (builder, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(left: 13, bottom: 12),
                  width: MediaQuery.sizeOf(context).width * .46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(.3),
                        BlendMode.darken,
                      ),
                      image: NetworkImage(
                        '$baseURLforImages${firstListName[index].posterPath}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 6,
                        ),
                        child: Text(firstListName[index].date),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 2, left: 6, right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black.withOpacity(.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              right: 5,
                              left: 5,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Text(
                                  "${firstListName[index].voteAverage}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
