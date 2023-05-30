import 'package:mymovielist/domain/datasources/actors_datasource.dart';
import 'package:mymovielist/domain/entities/actor.dart';
import 'package:mymovielist/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorsRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
