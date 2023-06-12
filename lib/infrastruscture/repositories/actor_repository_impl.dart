import 'package:mymovies/domain/datasources/actors_datasource.dart';
import 'package:mymovies/domain/entities/actor.dart';
import 'package:mymovies/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorsRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
