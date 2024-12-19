class TrendingModel {
  final int id;
  final String posterPath;
  final double voteAverage;
  final String mediaType;
  final int indexNo;

  TrendingModel({
    required this.id,
    required this.posterPath,
    required this.voteAverage,
    required this.mediaType,
    required this.indexNo,
  });

  // دالة لتحويل JSON إلى كائن Dart
  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      id: json['id'],
      posterPath: json['poster_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      mediaType: json['media_type'] ?? '',
      indexNo: 0, // سيتم تعيين القيمة الافتراضية للـ indexNo هنا
    );
  }
}
