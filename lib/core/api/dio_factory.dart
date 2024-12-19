import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 50);
    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          connectTimeout: timeOut,
          receiveTimeout: timeOut,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      _addDioInterceptor();
    }
    return dio!;
  }

  // إضافة Interceptor لـ Dio
  static void _addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }
}
