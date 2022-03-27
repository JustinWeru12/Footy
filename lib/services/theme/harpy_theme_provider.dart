import 'package:flutter/material.dart';
import 'package:football/services/theme/bloc/theme_bloc.dart';
import 'package:football/services/theme/harpy_theme.dart';
import 'package:provider/provider.dart';

/// Provides the currently used [FootballTheme] to its descendants.
class FootballThemeProvider extends StatelessWidget {
  const FootballThemeProvider({required this.child, Key? key})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProxyProvider2<ThemeBloc, Brightness, FootballTheme>(
      update: (_, themeBloc, systemBrightness, __) {
        final harpyTheme = systemBrightness == Brightness.light
            ? themeBloc.state.lightFootballTheme
            : themeBloc.state.darkFootballTheme;

        // match the system ui to the current theme
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          updateSystemUi(harpyTheme);
        });

        return harpyTheme;
      },
      child: child,
    );
  }
}
