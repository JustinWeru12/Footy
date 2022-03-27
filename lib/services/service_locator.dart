import 'package:football/services/navigator.dart';
import 'package:get_it/get_it.dart';

final app = GetIt.instance;

/// Adds all globally available services to the service locator.
void setupServices() {
  app.registerLazySingleton(FootballNavigator.new);
}
