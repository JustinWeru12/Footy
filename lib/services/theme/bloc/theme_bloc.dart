import 'dart:convert';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/football.dart';
import 'package:football/services/config_cubit.dart';
import 'package:football/services/init_logger.dart';
import 'package:football/services/theme/predefined_themes.dart';
import 'package:football/services/service_locator.dart';
import 'package:football/services/theme/footy_theme.dart';
import 'package:football/services/theme/footy_theme_data.dart';
import 'package:football/services/theme/theme_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';

/// Handles changing the light and dark themes and loading + updating custom
/// theme data.
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required this.configCubit,
  }) : super(
          ThemeState(
            lightThemeData: isFree ? predefinedThemes[0] : predefinedThemes[1],
            darkThemeData: predefinedThemes[0],
            config: configCubit.state,
            customThemesData: const [],
          ),
        ) {
    on<ThemeEvent>(
      (event, emit) => event.handle(this, emit),
      transformer: sequential(),
    );

    configCubit.stream.listen((config) {
      add(ThemeEvent.updateConfig(config: config));
    });
  }

  final ConfigCubit configCubit;
}

/// Updates the system ui to match the [theme].
void updateSystemUi(FootballTheme theme) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: theme.statusBarColor,
      statusBarBrightness: theme.statusBarBrightness,
      statusBarIconBrightness: theme.statusBarIconBrightness,
      systemNavigationBarColor: theme.navBarColor,
      systemNavigationBarDividerColor: theme.navBarColor,
      systemNavigationBarIconBrightness: theme.navBarIconBrightness,
    ),
  );
}

@freezed
class ThemeState with _$ThemeState {
  factory ThemeState({
    /// The selected light theme which will be used when the device is using the
    /// system light theme.
    required FootballThemeData lightThemeData,

    /// The selected dark theme which will be used when the device is using the
    /// system dark theme.
    required FootballThemeData darkThemeData,

    /// The list of custom themes for the currently authenticated user.
    required List<FootballThemeData> customThemesData,
    required Config config,
  }) = _State;

  ThemeState._();

  late final lightFootballTheme = FootballTheme.fromData(
    data: lightThemeData,
    config: config,
  );

  late final darkFootballTheme = FootballTheme.fromData(
    data: darkThemeData,
    config: config,
  );
}
