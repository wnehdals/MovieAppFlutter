import 'package:dio/dio.dart';
import 'package:first_flutter/domain/model/result.dart';

abstract class MovieRepository {
  Future<Result> getSearchList(String keyword, int page);
}