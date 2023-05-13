import 'package:dio/dio.dart';

import '../model/movie_model.dart';

class APICall {
  Future<Response> getSearchList(String keyword, int page) async {
      return await DioClient._instance.dio.get(
        "",
        queryParameters: {"s": keyword, "page": page},
      );
  }
}

class DioClient {
  late Dio dio;
  static final DioClient _instance = DioClient._internal();

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    var options = BaseOptions(
        baseUrl: "https://www.omdbapi.com/?apikey=92e32667",
        connectTimeout: 5000,
        receiveTimeout: 3000);
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor());
  }
}
/*
class RemoteMovieDataSource {
  late DioClient dioClient;
  static final RemoteMovieDataSource _instance =
      RemoteMovieDataSource._internal();

  factory RemoteMovieDataSource() {
    return _instance;
  }

  RemoteMovieDataSource._internal() {
    dioClient = DioClient();
  }

  Future<Resp> getResp(String s, int page) async {
    try {
      var response = await dioClient.dio.get(
        "",
        queryParameters: {"s": s, "page": page},
      );
      if (response.statusCode == 200) {
        //onSuccess(Resp.fromJson(response.data as Map<String, dynamic>));
        return Resp.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
        return Resp();
    }

  }
}

 */
