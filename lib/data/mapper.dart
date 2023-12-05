import 'package:first_flutter/domain/model/movie_card.dart';

import 'model/movie_model.dart';

extension SearchExtension on Search {
  MovieCard toMovieCard() {
    return MovieCard(
        id: imdbID,
        poster: poster,
        rank: -1,
      title: title,
      isFavorite: false
    );
  }
}