import 'package:clean_arche_bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arche_bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arche_bookly_app/Features/home/data/repo/home_repo_impl.dart';
import 'package:clean_arche_bookly_app/Features/home/domain/repo/home_repo.dart';
import 'package:clean_arche_bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}
