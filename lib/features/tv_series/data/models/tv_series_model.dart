class TvModel {
  final String name;
  final String posterPath;
  final double voteAverage;
  final String date;
  final int id;

  TvModel({
    required this.date,
    required this.id,
    required this.name,
    required this.posterPath,
    required this.voteAverage,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      date: json['first_air_date'] ?? '', // تجنب null
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(), // تحويل إلى double
    );
  }
}
