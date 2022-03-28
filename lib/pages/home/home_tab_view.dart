import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/pages/home/models/home_app_bar.dart';
import 'package:football/pages/home/models/home_drawer.dart';
import 'package:football/pages/home/models/home_tab_entry.dart';
import 'package:football/pages/home/models/home_tab_model.dart';
import 'package:football/services/config_cubit.dart';
import 'package:football/services/scroll_direction_listener.dart';
import 'package:provider/provider.dart';

// TODO: when switching tabs in the home tab view, consider scrolling the
//  content automatically if it is otherwise covered by the tab bar

class HomeTabView extends StatelessWidget {
  const HomeTabView();

  static const _indexOffset = 1;

  Widget _mapEntryContent(
    int index,
    HomeTabEntry entry,
    double refreshIndicatorOffset,
  ) {
    if (entry.isDefaultType) {
      switch (entry.id) {
        case 'home':
          return Container();
        case 'media':
          return Container();
        case 'mentions':
          return Container();
        case 'search':
          return Container();
        default:
          return const SizedBox();
      }
    } else if (entry.isListType) {
      return Container();
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigCubit>().state;
    final model = context.watch<HomeTabModel>();

    final refreshIndicatorOffset = config.bottomAppBar
        ? 0.0
        : HomeAppBar.height(context) + config.paddingValue;

    return DefaultTabController(
      length: model.visibleEntries.length + 1,
      initialIndex: _indexOffset,
      child: _HomeTabListener(
        child: Stack(
          children: [
            TabBarView(
              children: [
                const HomeDrawer(),
                for (var i = 0; i < model.visibleEntries.length; i++)
                  _mapEntryContent(
                    i,
                    model.visibleEntries[i],
                    refreshIndicatorOffset,
                  ),
              ],
            ),
            const HomeAppBar(),
          ],
        ),
      ),
    );
  }
}

class _HomeTabListener extends StatefulWidget {
  const _HomeTabListener({
    required this.child,
  });

  final Widget child;

  @override
  _HomeTabListenerState createState() => _HomeTabListenerState();
}

class _HomeTabListenerState extends State<_HomeTabListener> {
  late TabController _controller;
  late ScrollDirection _scrollDirection;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _controller = DefaultTabController.of(context)!
      ..animation!.addListener(_listener);
    _scrollDirection = ScrollDirection.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();

    _controller.animation!.removeListener(_listener);
  }

  void _listener() {
    if (mounted) {
      if (_scrollDirection.down) {
        _scrollDirection.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
