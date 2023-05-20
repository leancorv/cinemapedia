import 'package:cinemapedia/infrastruscture/datasources/isar_datasource.dart';
import 'package:cinemapedia/infrastruscture/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
