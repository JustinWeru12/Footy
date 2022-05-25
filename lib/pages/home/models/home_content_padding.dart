import 'package:flutter/material.dart';
import 'package:football/pages/home/models/home_app_bar.dart';
import 'package:football/services/config_cubit.dart';
import 'package:provider/provider.dart';

/// Top padding for content in the [HomeTabView].
class HomeTopPadding extends StatelessWidget {
  const HomeTopPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final config = context.watch<ConfigCubit>().state;

    if (!config.bottomAppBar) {
      return SizedBox(height: HomeAppBar.height(context));
    } else {
      return SizedBox(height: mediaQuery.padding.top);
    }
  }
}

class HomeTopSliverPadding extends StatelessWidget {
  const HomeTopSliverPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: HomeTopPadding(),
    );
  }
}

/// Bottom padding for content in the [HomeTabView].
class HomeBottomPadding extends StatelessWidget {
  const HomeBottomPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final config = context.watch<ConfigCubit>().state;

    if (config.bottomAppBar) {
      return SizedBox(height: HomeAppBar.height(context));
    } else {
      return SizedBox(height: mediaQuery.padding.bottom);
    }
  }
}

class HomeBottomSliverPadding extends StatelessWidget {
  const HomeBottomSliverPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: HomeBottomPadding(),
    );
  }
}
