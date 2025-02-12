import 'package:flutter_mvvm_basic/data/movies_repository.dart';
import 'package:flutter_mvvm_basic/services/api_services.dart';
import 'package:flutter_mvvm_basic/services/api_services_protocol.dart';
import 'package:flutter_mvvm_basic/utils/app_context_utils.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationUtils>(() => NavigationUtils());
  getIt.registerLazySingleton<ApiServicesProtocol>(
      () => MoviesRepository(protocol: ApiServices()));
}
