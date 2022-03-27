import 'package:flutter/material.dart';
import 'package:football/services/theme/harpy_theme.dart';
import 'package:provider/provider.dart';

/// Builds a background with a gradient from top to bottom.
///
/// The [colors] default to the [FootballTheme.backgroundColors] if omitted.
class FootballBackground extends StatelessWidget {
  const FootballBackground(
      {this.child, this.colors, this.borderRadius, Key? key})
      : super(key: key);

  final Widget? child;
  final List<Color>? colors;

  /// The [borderRadius] of the [BoxDecoration].
  final BorderRadius? borderRadius;

  LinearGradient _buildGradient(List<Color> backgroundColors) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: backgroundColors.length > 1
          ? backgroundColors
          : [
              backgroundColors.first,
              backgroundColors.first,
            ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final harpyTheme = context.watch<FootballTheme>();

    final backgroundColors = colors ?? harpyTheme.backgroundColors;

    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: _buildGradient(backgroundColors),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: child ?? const SizedBox(),
      ),
    );
  }
}
