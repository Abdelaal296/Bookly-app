import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/home/data/repo/home_repo_impl.dart';
import 'api_service.dart';

final getIt =GetIt.instance;

void setupServiceLactor(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}