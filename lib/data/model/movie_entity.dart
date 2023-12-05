class MovieEntity {
  final String id;
  final String? title;
  final String? year;
  final String? type;
  final String? poster;
  final int? rank;
  MovieEntity({required this.id, this.title, this.year, this.type, this.poster, this.rank});
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title' : title,
      'year' : year,
      'type' : type,
      'poster' : poster,
      'rank' : rank
    };
  }
}