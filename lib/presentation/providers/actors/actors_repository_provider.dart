import 'package:mymovies/infrastruscture/datasources/actor_moviedb_datasource.dart';
import 'package:mymovies/infrastruscture/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(ActorMovieDbDatasource());
});
