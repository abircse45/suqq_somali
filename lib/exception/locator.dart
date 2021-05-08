import 'package:get_it/get_it.dart';
import 'package:suuq_somali/internet_check/custom_internet_checker.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CustomFunction());
}
