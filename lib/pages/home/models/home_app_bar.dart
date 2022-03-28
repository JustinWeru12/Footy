import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/widgets/widgets.dart';
import 'package:football/pages/home/models/home_tab_bar.dart';
import 'package:football/services/animations/animated_shifted_position.dart';
import 'package:football/services/config_cubit.dart';
import 'package:football/services/scroll_direction_listener.dart';
import 'package:football/services/theme/harpy_theme.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  static double height(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final config = context.read<ConfigCubit>().state;

    final systemPadding = config.bottomAppBar
        ? mediaQuery.padding.bottom
        : mediaQuery.padding.top;

    return FootballTab.height(context) + systemPadding + 4;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final config = context.watch<ConfigCubit>().state;

    final topPadding = config.bottomAppBar ? 0.0 : mediaQuery.padding.top + 4;
    final bottomPadding =
        config.bottomAppBar ? mediaQuery.padding.bottom + 4 : 0.0;

    final padding = EdgeInsets.only(
      top: topPadding,
      bottom: bottomPadding,
      left: config.paddingValue,
      right: config.paddingValue,
    );

    // since the sliver app bar does not work as intended with the nested
    // scroll view in the home tab view, we use an animated shifted position
    // widget and animate the app bar out of the view based on the scroll
    // position to manually hide / show the app bar
    return Align(
      alignment:
          config.bottomAppBar ? Alignment.bottomCenter : Alignment.topCenter,
      child: config.hideHomeTabBar
          ? _DynamicAppBar(padding: padding)
          : _StaticAppBar(padding: padding),
    );
  }
}

class _DynamicAppBar extends StatelessWidget {
  const _DynamicAppBar({
    required this.padding,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final scrollDirection = ScrollDirection.of(context)!;
    final harpyTheme = context.watch<FootballTheme>();
    final config = context.watch<ConfigCubit>().state;

    return AnimatedShiftedPosition(
      shift: scrollDirection.direction == VerticalDirection.down
          ? config.bottomAppBar
              ? const Offset(0, 1)
              : const Offset(0, -1)
          : Offset.zero,
      child: AnnotatedRegion(
        value: harpyTheme.systemUiStyle,
        child: HomeTabBar(
          padding: padding,
        ),
      ),
    );
  }
}

class _StaticAppBar extends StatelessWidget {
  const _StaticAppBar({
    required this.padding,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return HomeTabBar(
      padding: padding,
    );
  }
}
