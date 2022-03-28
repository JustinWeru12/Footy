import 'package:football/services/harpy_preferences.dart';
import 'package:football/services/service_locator.dart';

class HomeTabPreferences {
  const HomeTabPreferences();

  /// The json encoded string for the home tab bar configuration.
  String get homeTabConfiguration => app<FootballPreferences>()
      .getString('homeTabConfiguration', '', prefix: true);
  set homeTabConfiguration(String value) => app<FootballPreferences>()
      .setString('homeTabConfiguration', value, prefix: true);
}
