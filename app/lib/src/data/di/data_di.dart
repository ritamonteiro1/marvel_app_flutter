import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../domain/repository/marvel_repository.dart';
import '../local/data_source/marvel_local_data_source.dart';
import '../local/data_source/marvel_local_data_source_impl.dart';
import '../mapper/marvel_mapper.dart';
import '../mapper/marvel_mapper_impl.dart';
import '../remote/data_source/marvel_remote_data_source.dart';
import '../remote/data_source/marvel_remote_data_source_impl.dart';
import '../repository/marvel_repository_impl.dart';

void dataDI() {
  final getIt = GetIt.instance;

  getIt
    ..registerFactory<MarvelMapper>(
      () => MarvelMapperImpl(),
    )
    ..registerSingleton<MarvelRemoteDataSource>(
      MarvelRemoteDataSourceImpl(
        mapper: getIt.get<MarvelMapper>(),
        httpClient: http.Client(),
      ),
    )
    ..registerSingleton<MarvelLocalDataSource>(
      MarvelLocalDataSourceImpl(
        mapper: getIt.get<MarvelMapper>(),
        hive: Hive,
      ),
    )
    ..registerSingleton<MarvelRepository>(
      MarvelRepositoryImpl(
        remoteDataSource: getIt.get<MarvelRemoteDataSource>(),
        localDataSource: getIt.get<MarvelLocalDataSource>(),
      ),
    )
    ..registerSingleton<LoggerRepository>(
      LoggerRepositoryImpl(),
    );
}
