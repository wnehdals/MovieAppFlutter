import '../model/movie_entity.dart';

abstract class MovieDao {
  Future<void> update(MovieEntity entity);
  Future<void> insert(MovieEntity entity);
  Future<void> updateAll(List<MovieEntity>? entities);
  Future<void> delete(MovieEntity entity);
  Future<List<MovieEntity>> loadAll();
}