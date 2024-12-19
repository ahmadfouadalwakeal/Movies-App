class MovieModel {
  final String name;
  final String posterPath;
  final double voteAverage;
  final String date;
  final int id;

  MovieModel({
    required this.name,
    required this.posterPath,
    required this.voteAverage,
    required this.date,
    required this.id,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      name: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      date: json['release_date'] ?? '',
      id: json['id'] ?? 0,
    );
  }
}
