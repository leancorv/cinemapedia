import 'package:cinemapedia/infrastruscture/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastruscture/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(ActorMovieDbDatasource());
});
