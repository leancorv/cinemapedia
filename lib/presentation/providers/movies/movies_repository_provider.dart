import 'package:cinemapedia/infrastruscture/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastruscture/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  // return MovieRepositoryImpl(IMDBdatasource());
  return MovieRepositoryImpl(MoviedbDatasource());
});
