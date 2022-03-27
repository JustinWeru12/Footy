import 'package:football/football.dart';
import 'package:football/services/harpy_preferences.dart';
import 'package:football/services/service_locator.dart';

class ThemePreferences {
  const ThemePreferences();

  /// The id of the selected light and dark themes.
  ///
  /// - 0..9: index of predefined theme (unused indices are reserved)
  /// - 10+:  index of custom theme
  ///
  /// The default light and dark theme for the free version is the same (0).
  /// Defaults to 0 for the dark and 1 for the light theme in the pro version.
  int get lightThemeId => app<FootballPreferences>()
      .getInt('lightThemeId', isFree ? 0 : 1, prefix: true);
  set lightThemeId(int value) =>
      app<FootballPreferences>().setInt('lightThemeId', value, prefix: true);

  int get darkThemeId =>
      app<FootballPreferences>().getInt('darkThemeId', 0, prefix: true);
  set darkThemeId(int value) =>
      app<FootballPreferences>().setInt('darkThemeId', value, prefix: true);

  /// A list of encoded harpy theme data representing custom themes.
  List<String> get customThemes =>
      app<FootballPreferences>().getStringList('customThemes', prefix: true);
  set customThemes(List<String?> value) => app<FootballPreferences>()
      .setStringList('customThemes', value, prefix: true);
}
