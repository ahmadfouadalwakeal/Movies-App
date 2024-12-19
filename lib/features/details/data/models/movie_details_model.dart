import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart'; // هذا الملف سيتم إنشاؤه بواسطة build_runner

@JsonSerializable()
class MovieDetails {
  final String backdropPath;
  final String title;
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final int runtime;
  final int budget;
  final int revenue;
  final List<Genre>? genres; // genre ستكون كائنات Genre

  MovieDetails({
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.budget,
    required this.revenue,
    required this.genres,
  });

  // الدالة الخاصة بـ fromJson
  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  // الدالة الخاصة بـ toJson
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

// كلاس Genre
@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  // من أجل تحويل Genre من JSON
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  // من أجل تحويل Genre إلى JSON
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
