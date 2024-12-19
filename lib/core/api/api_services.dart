import 'package:dio/dio.dart';

import '../../features/home_page/data/models/trending_model.dart';
import '../../features/movie_search/data/models/movie_search_model.dart';
import '../../features/movies/data/models/movie_model.dart';
import '../../features/tv_series/data/models/tv_series_model.dart';
import 'api_failure.dart';
import 'api_key.dart';
import 'dio_factory.dart';

class ApiServices {
  final String apiKey = ApiKey.value;
  final Dio _dio;

  ApiServices() : _dio = DioFactory.getDio();

  // دالة عامة لجلب البيانات مع دعم query parameters
  Future<List<T>> fetchData<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, String>? queryParameters,
  }) async {
    try {
      // إعداد query parameters
      final params = {'api_key': apiKey, ...?queryParameters};
      // إرسال الطلب
      final response = await _dio.get(endpoint, queryParameters: params);
      if (response.statusCode == 200) {
        // معالجة البيانات
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> items = jsonData["results"] ?? [];
        return items.map((json) => fromJson(json)).toList();
      } else {
        throw Failure('Failed to load data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // معالجة أخطاء Dio
      if (e.response != null) {
        throw Failure(
            'Dio error: ${e.response?.statusCode}, ${e.response?.statusMessage}');
      } else {
        throw Failure('Network error: ${e.message}');
      }
    } catch (e) {
      throw Failure('Unexpected error: $e');
    }
  }

  //! trendingWeekListHome
  Future<List<TrendingModel>> trendingWeekListHome() async {
    return fetchData(
        '/trending/all/week', (json) => TrendingModel.fromJson(json));
  }

  //! trendingDayListHome
  Future<List<TrendingModel>> trendingDayListHome() async {
    return fetchData(
        '/trending/all/day', (json) => TrendingModel.fromJson(json));
  }

  //! popularTvSeries
  Future<List<TvModel>> popularTvSeries() async {
    return fetchData('/tv/popular', (json) => TvModel.fromJson(json));
  }

  //! topRatedTvSeries
  Future<List<TvModel>> topRatedTvSeries() async {
    return fetchData('/tv/top_rated', (json) => TvModel.fromJson(json));
  }

  //! onAirTvSeries
  Future<List<TvModel>> onAirTvSeries() async {
    return fetchData('/tv/on_the_air', (json) => TvModel.fromJson(json));
  }

  //! popularMovies
  Future<List<MovieModel>> popularMovies() async {
    return fetchData('/movie/popular', (json) => MovieModel.fromJson(json));
  }

  //! nowPlayingMovies
  Future<List<MovieModel>> nowPlayingMovies() async {
    return fetchData('/movie/now_playing', (json) => MovieModel.fromJson(json));
  }

  //! topRatedMovies
  Future<List<MovieModel>> topRatedMovies() async {
    return fetchData('/movie/top_rated', (json) => MovieModel.fromJson(json));
  }

  //! latestMovies
  Future<List<MovieModel>> latestMovies() async {
    return fetchData('/movie/latest', (json) => MovieModel.fromJson(json));
  }

  //! moviesSearch
  Future<List<MovieSearchModel>> moviesSearch(String query) async {
    return fetchData(
      '/search/multi',
      (json) => MovieSearchModel.fromJson(json),
      queryParameters: {
        'query': query,
      },
    );
  }

// استخدام fetchData لجلب المراجعات
  // Future<List<ReviewModel>> fetchMovieReviews(int movieId) async {
  //   return fetchData(
  //     '/movie/$movieId/reviews',
  //     (json) => ReviewModel.fromJson(json),
  //   );
  // }
  // Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
  //  return fetchData(
  //     '/movie/$movieId/similar',
  //     (json) => MovieModel.fromJson(json),
  //   );

  // }
  // // استخدام fetchData لجلب الأفلام المشابهة
  // Future<List<MovieDetailsModel>> fetchSimilarMovies(int movieId) async {
  //   return fetchData(
  //     '/movie/$movieId/similar',
  //     (json) => MovieModel.fromJson(json),
  //   );
  // }

  // // استخدام fetchData لجلب الأفلام الموصى بها
  // Future<List<MovieDetailsModel>> fetchRecommendedMovies(int movieId) async {
  //   return fetchData(
  //     '/movie/$movieId/recommendations',
  //     (json) => MovieModel.fromJson(json),
  //   );
  // }

  // // استخدام fetchData لجلب المقاطع الدعائية
  // Future<List<TrailerModel>> fetchMovieTrailers(int movieId) async {
  //   return fetchData(
  //     '/movie/$movieId/videos',
  //     (json) => TrailerModel.fromJson(json),
  //   );
  // }
}
