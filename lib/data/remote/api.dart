import 'package:dio/dio.dart';
import 'package:first_flutter/data/datasources/remote_movie_datasource.dart';

abstract class Api {
  Future<Response> getSearchList(String keyword, int page);
}
class ApiImpl implements Api {
  late Dio dio;
  ApiImpl() {
    dio = Dio(BaseOptions(
          baseUrl: "https://www.omdbapi.com/?apikey=92e32667",
          connectTimeout: 5000,
          receiveTimeout: 3000,
          sendTimeout: 3000
      ));
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }


  @override
  Future<Response> getSearchList(String keyword, int page) async {
    try {
      return await dio.get(
        "",
        queryParameters: {"s": keyword, "page": page},
      );
    } on DioError catch (e) {
      return e.response!;
    }
  }
}