import 'package:dio/dio.dart';

import '../model/movie_model.dart';
import '../remote/api.dart';
import '../remote/single.dart';

abstract class RemoteMovieDataSource {
  Future<Single<SearchResp>> getSearchList(String keyword, int page);
}
class RemoteMovieDataSourceImpl implements RemoteMovieDataSource{
  final Api _api;
  RemoteMovieDataSourceImpl({required Api api}) : _api = api;

  @override
  Future<Single<SearchResp>> getSearchList(String keyword, int page) async {
    Response resp = await _api.getSearchList(keyword, page);
    return Single<SearchResp>().subscribe(resp, SearchResp.fromJson);
  }

}
