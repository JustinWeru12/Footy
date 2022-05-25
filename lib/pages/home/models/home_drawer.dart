import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:football/pages/home/models/home_content_padding.dart';
import 'package:football/services/animations/shifted_position.dart';
import 'package:football/services/config_cubit.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/services/general_preferences.dart';
import 'package:football/services/service_locator.dart';
import 'package:football/services/theme/harpy_theme.dart';
import 'package:football/widgets/harpy_circle_avatar.dart';
import 'package:football/widgets/widgets.dart';
import 'package:provider/provider.dart';

/// A fullscreen-sized navigation drawer for the [HomeTabView].
///
/// Entries are animated dynamically based on the animation in the tab view.
class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigCubit>().state;

    return _DrawerAnimationListener(
      builder: (context) {
        final animationController = context.watch<AnimationController>();

        return ListView(
          padding: config.edgeInsets,
          children: [
            const HomeTopPadding(),
            const _AuthenticatedUser(),
            verticalSpacer,
            verticalSpacer,
            _Entries(animationController),
            const HomeBottomPadding(),
          ],
        );
      },
    );
  }
}

class _DrawerAnimationListener extends StatefulWidget {
  const _DrawerAnimationListener({
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  _DrawerAnimationListenerState createState() =>
      _DrawerAnimationListenerState();
}

class _DrawerAnimationListenerState extends State<_DrawerAnimationListener>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _tabController = DefaultTabController.of(context)!;
    _tabController.animation!.addListener(_tabControllerListener);
  }

  @override
  void dispose() {
    _tabController.animation!.removeListener(_tabControllerListener);
    _controller.dispose();

    super.dispose();
  }

  void _tabControllerListener() {
    if (mounted) {
      final value = 1 - _tabController.animation!.value;

      if (value >= 0 && value <= 1 && value != _controller.value) {
        _controller.value = value;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => _controller,
      child: Builder(builder: widget.builder),
    );
  }
}

class _AuthenticatedUser extends StatelessWidget {
  const _AuthenticatedUser();

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigCubit>().state;

    return InkWell(
      borderRadius: kBorderRadius,
      onTap: () => () {},
      child: Card(
        child: Padding(
          padding: config.edgeInsets,
          child: Row(
            children: [
              const FootballCircleAvatar(
                radius: 35,
                imageUrl:
                    "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
              ),
              horizontalSpacer,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Adams",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    smallVerticalSpacer,
                    Text(
                      'johnadams@gmail.com',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Entries extends StatelessWidget {
  const _Entries(this.controller);

  final AnimationController controller;

  List<Widget> _animate(List<Widget> children) {
    final animated = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      final offsetAnimation = Tween<Offset>(
        begin: Offset(lerpDouble(-.3, -2, i / children.length)!, 0),
        end: Offset.zero,
      ).animate(controller);

      animated.add(
        ShiftedPosition(
          shift: offsetAnimation.value,
          child: Opacity(
            opacity: controller.value,
            child: children[i],
          ),
        ),
      );
    }

    return animated;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = context.watch<ConfigCubit>().state;

    final List<Widget> children = [
      FootballListCard(
          leading: const Icon(CupertinoIcons.person),
          title: const Text('profile'),
          onTap: () {}),
      verticalSpacer,
      FootballListCard(
          leading: const Icon(CupertinoIcons.search),
          title: const Text('search'),
          onTap: () {}),
      verticalSpacer,
      FootballListCard(
        leading: const Icon(CupertinoIcons.list_bullet),
        title: const Text('leagues'),
        onTap: () {},
      ),
      verticalSpacer,
      verticalSpacer,
      FootballListCard(
        leading: const Icon(FeatherIcons.settings),
        title: const Text('settings'),
        onTap: () => {},
      ),
      verticalSpacer,
      FootballListCard(
          leading: const Icon(FeatherIcons.star),
          title: const Text('pro'),
          onTap: () {}),
      verticalSpacer,
      FootballListCard(
        leading: const Icon(FeatherIcons.info),
        title: const Text('about'),
        onTap: () {},
      ),
      verticalSpacer,
      verticalSpacer,
      FootballListCard(
        leading: Icon(
          CupertinoIcons.square_arrow_left,
          color: theme.colorScheme.error,
        ),
        title: const Text('logout'),
        onTap: () async {},
      ),
    ];

    return Column(
      children: app<GeneralPreferences>().performanceMode
          ? children
          : _animate(children),
    );
  }
}
