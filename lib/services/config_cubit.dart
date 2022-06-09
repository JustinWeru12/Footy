import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/services/footy_preferences.dart';
import 'package:football/services/service_locator.dart';
import 'package:football/services/theme/footy_theme.dart';

part 'config.dart';

/// Handles loading, updating and persisting the [Config] which is used for
/// configuration of ui components in the app.
class ConfigCubit extends Cubit<Config> {
  ConfigCubit() : super(Config.defaultConfig);

  void initialize() {
    final fontSizeDeltaId = app<FootballPreferences>().getInt(
      'fontSizeDeltaId',
      0,
    );

    final compactMode =
        app<FootballPreferences>().getBool('compactMode', false);
    final bottomAppBar =
        app<FootballPreferences>().getBool('bottomAppBar', false);
    final hideHomeTabBar = app<FootballPreferences>().getBool(
      'hideHomeTabBar',
      true,
    );

    final displayFontFamily = app<FootballPreferences>().getString(
      'displayFontFamily',
      kDisplayFontFamily,
    );

    final bodyFontFamily = app<FootballPreferences>().getString(
      'bodyFontFamily',
      kBodyFontFamily,
    );

    final showAbsoluteTime = app<FootballPreferences>().getBool(
      'showAbsoluteTime',
      false,
    );

    emit(
      state.copyWith(
        compactMode: compactMode,
        fontSizeDelta: _fontSizeDeltaIdMap[fontSizeDeltaId] ?? 0,
        bottomAppBar: bottomAppBar,
        displayFont: displayFontFamily,
        bodyFont: bodyFontFamily,
        hideHomeTabBar: hideHomeTabBar,
        showAbsoluteTime: showAbsoluteTime,
      ),
    );
  }

  void resetToDefault() {
    app<FootballPreferences>().setInt('fontSizeDeltaId', 0);
    app<FootballPreferences>().setBool('compactMode', false);
    app<FootballPreferences>().setBool('bottomAppBar', false);

    app<FootballPreferences>().setString(
      'displayFontFamily',
      kDisplayFontFamily,
    );

    app<FootballPreferences>().setString(
      'bodyFontFamily',
      kBodyFontFamily,
    );

    app<FootballPreferences>().setBool(
      'showAbsoluteTime',
      false,
    );

    emit(Config.defaultConfig);
  }

  void updateCompactMode(bool value) {
    app<FootballPreferences>().setBool('compactMode', value);

    emit(state.copyWith(compactMode: value));
  }

  void updateFontSizeDelta(double value) {
    final fontSizeDeltaId = _fontSizeDeltaIdMap.entries
        .firstWhere(
          (element) => element.value == value,
          orElse: () => const MapEntry<int, double>(0, 0),
        )
        .key;

    app<FootballPreferences>().setInt('fontSizeDeltaId', fontSizeDeltaId);

    emit(
      state.copyWith(
        fontSizeDelta: _fontSizeDeltaIdMap[fontSizeDeltaId] ?? 0,
      ),
    );
  }

  void updateDisplayFont(String fontFamily) {
    app<FootballPreferences>().setString('displayFontFamily', fontFamily);

    emit(state.copyWith(displayFont: fontFamily));
  }

  void updateBodyFont(String fontFamily) {
    app<FootballPreferences>().setString('bodyFontFamily', fontFamily);

    emit(state.copyWith(bodyFont: fontFamily));
  }

  void updateBottomAppBar(bool value) {
    app<FootballPreferences>().setBool('bottomAppBar', value);

    emit(state.copyWith(bottomAppBar: value));
  }

  void updateHideHomeTabBar(bool value) {
    app<FootballPreferences>().setBool('hideHomeTabBar', value);

    emit(state.copyWith(hideHomeTabBar: value));
  }

  void updateShowAbsoluteTime(bool value) {
    app<FootballPreferences>().setBool('showAbsoluteTime', value);

    emit(state.copyWith(showAbsoluteTime: value));
  }
}
