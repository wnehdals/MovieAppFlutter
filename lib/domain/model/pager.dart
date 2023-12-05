import 'movie_card.dart';

class Pager {
  int page;
  int total;
  List<MovieCard> data;
  Pager(this.page, this.total, this.data);
  int? getNextPage() {
    int maxPage = (total / 10).toInt() + 1;
    if (page < total) {
      return page + 1;
    } else {
      return null;
    }
  }
}