import 'package:dio/dio.dart';
import 'package:first_flutter/domain/model/pager.dart';
import 'package:first_flutter/domain/model/result.dart';
import 'package:first_flutter/domain/repository/movie_repository.dart';

class GetSearchMovieUseCase {
  final MovieRepository _movieRepository;
  GetSearchMovieUseCase({
    required MovieRepository movieRepository
  }) : _movieRepository = movieRepository;

  Future<Result> execute(String keyword, int page) async {
    return await _movieRepository.getSearchList(keyword, page);
  }

}