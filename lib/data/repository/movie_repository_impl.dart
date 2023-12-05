import 'package:dio/dio.dart';
import 'package:first_flutter/data/datasources/remote_movie_datasource.dart';
import 'package:first_flutter/data/mapper.dart';
import 'package:first_flutter/data/model/BaseResp.dart';
import 'package:first_flutter/data/model/movie_model.dart';
import 'package:first_flutter/domain/model/fail_data.dart';
import 'package:first_flutter/domain/model/movie_card.dart';
import 'package:first_flutter/domain/model/result.dart';
import 'package:first_flutter/domain/repository/movie_repository.dart';

import '../../domain/model/pager.dart';
import '../remote/single.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteMovieDataSource _remoteDataSource;
  MovieRepositoryImpl({
    required RemoteMovieDataSource remoteDataSource
  }) : _remoteDataSource = remoteDataSource;
  @override
  Future<Result> getSearchList(String keyword, int page) async {
     Single<SearchResp> single = await _remoteDataSource.getSearchList(keyword, page);
     Result result = Fail(FailData(code: "404", msg: "Unknown"));
     if (single is SingleSuccess) {
       SearchResp resp = (single as SingleSuccess).data;
       List<Search> searches = resp.search ?? [];
       List<MovieCard> movieList = searches.map((e) => e.toMovieCard()).toList();
       String total = resp.totalResults ?? "0";
       return Success(Pager(page, int.parse(total), movieList));
     } else {
       BaseResp resp = (single as SingleError).e;
       return Fail(FailData(code: resp.response ?? "404", msg: resp.error ?? "Unknown"));
     }
  }

}