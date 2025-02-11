import 'package:flutter_mvvm_basic/utils/app_context_utils.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationUtils>(() => NavigationUtils());
}
