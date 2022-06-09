import 'package:football/pages/home/models/home_tab_preferences.dart';
import 'package:football/services/general_preferences.dart';
import 'package:football/services/footy_preferences.dart';
import 'package:football/services/navigator.dart';
import 'package:football/services/theme/theme_preferences.dart';
import 'package:get_it/get_it.dart';

final app = GetIt.instance;

/// Adds all globally available services to the service locator.
void setupServices() {
  app
    ..registerLazySingleton(FootballNavigator.new)
    ..registerLazySingleton(FootballPreferences.new)
    ..registerLazySingleton(() => const HomeTabPreferences())
    ..registerLazySingleton(() => const GeneralPreferences())
    ..registerLazySingleton(() => const ThemePreferences());
}
