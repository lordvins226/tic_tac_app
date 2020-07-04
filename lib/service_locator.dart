import 'package:get_it/get_it.dart';

import 'core/providers/google_sign_in_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GoogleProvider());
}