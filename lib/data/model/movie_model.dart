import 'dart:convert';

import 'package:first_flutter/data/model/BaseResp.dart';

class SearchResp extends BaseResp {
  final List<Search>? search;
  final String? totalResults;

  SearchResp({String? response, String? error, this.search, this.totalResults});

  factory SearchResp.fromJson(Map<String, dynamic> jsons) {
    List<Search> searchList =
        jsons['Search'].map<Search>((item) => Search.fromJson(item)).toList();

    //List<Search> searchList = list.map((i) => Search.fromJson(i)).toList as List<Search>;
    //List<Search> searchList = json['Search'].map<Search>((i) => Search.fromJson(i)).toList;
    return SearchResp(
        response: jsons['Response'],
        error: jsons['Error'],
        search: searchList,
        totalResults: jsons['totalResults'],
        );
  }

  @override
  String toString() {
    return "search : ${search}";
  }
}

class Search {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  Search(
      {this.title = "",
      this.year = "",
      this.imdbID = "",
      this.type = "",
      this.poster = ""});

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
        title: json['Title'],
        year: json['Year'],
        imdbID: json['imdbID'],
        type: json['Type'],
        poster: json['Poster']);
  }

  @override
  String toString() {
    return "title : ${title} / year : ${year} / imdbID : ${imdbID} / type : ${type} / poster : ${poster}\n";
  }
}
