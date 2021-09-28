import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_news_app/bloc/post_bloc.dart';
import 'package:sport_news_app/data/repo/post_repository.dart';
import 'package:sport_news_app/data/source/local_data_source/database_helper.dart';
import 'package:sport_news_app/data/source/local_data_source/local.dart';
import 'package:sport_news_app/data/source/remote_data_source/remote_data.dart';

import '../internet_connection.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => PostBloc(getIt()));
  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepository(getIt(), getIt(), getIt()),
  );
  getIt
      .registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource(getIt()));
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  getIt.registerLazySingleton<InternetConnection>(
      () => InternetConnection(getIt()));
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
}
