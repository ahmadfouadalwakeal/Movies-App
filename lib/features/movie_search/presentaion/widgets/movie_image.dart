import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_constant.dart';

class MovieImage extends StatelessWidget {
  final String posterPath;

  const MovieImage({required this.posterPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: NetworkImage('$baseURLforImages$posterPath'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
