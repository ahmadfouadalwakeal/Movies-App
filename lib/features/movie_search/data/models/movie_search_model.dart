class MovieSearchModel {
  final String posterPath;
  final double voteAverage;
  final String mediaType;
  final int id;
  final String overView;
  final double popularity;

  MovieSearchModel(
      {required this.posterPath,
      required this.voteAverage,
      required this.mediaType,
      required this.id,
      required this.overView,
      required this.popularity});

  factory MovieSearchModel.fromJson(Map<String, dynamic> json) {
    return MovieSearchModel(
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      mediaType: json['media_type'] ?? '',
      id: json['id'] ?? 0,
      overView: json['overview'] ?? '',
      popularity: (json['popularity'] as num).toDouble(),
    );
  }
}
