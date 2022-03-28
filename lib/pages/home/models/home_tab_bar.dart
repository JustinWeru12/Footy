import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:football/widgets/widgets.dart';
import 'package:football/pages/home/models/home_tab_entry.dart';
import 'package:football/pages/home/models/home_tab_entry_icon.dart';
import 'package:football/pages/home/models/home_tab_model.dart';
import 'package:football/services/navigator.dart';
import 'package:football/services/service_locator.dart';
import 'package:football/services/theme/harpy_theme.dart';
import 'package:provider/provider.dart';

/// Builds the tab bar with the tabs for the home screen.
class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    required this.padding,
    Key? key,
  }) : super(key: key);

  final EdgeInsets padding;

  Widget _mapEntryTabs(HomeTabEntry entry, Color cardColor) {
    if (entry.isDefaultType && entry.id == 'mentions') {
      return _MentionsTab(
        entry: entry,
      );
    } else {
      return FootballTab(
        icon: HomeTabEntryIcon(entry.icon),
        text: entry.hasName ? Text(entry.name!) : null,
        cardColor: cardColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final harpyTheme = context.watch<FootballTheme>();
    final model = context.watch<HomeTabModel>();

    final cardColor = harpyTheme.alternateCardColor;

    return FootballTabBar(
      padding: padding,
      tabs: [
        const _DrawerTab(),
        for (HomeTabEntry entry in model.visibleEntries)
          _mapEntryTabs(entry, cardColor),
      ],
      endWidgets: const [
        _CustomizeHomeTab(),
      ],
    );
  }
}

class _MentionsTab extends StatelessWidget {
  const _MentionsTab({
    required this.entry,
  });

  final HomeTabEntry entry;

  @override
  Widget build(BuildContext context) {
    final harpyTheme = context.watch<FootballTheme>();
    final child = FootballTab(
      icon: HomeTabEntryIcon(entry.icon),
      text: entry.hasName ? Text(entry.name!) : null,
      cardColor: harpyTheme.alternateCardColor,
    );

    return child;
  }
}

class _DrawerTab extends StatelessWidget {
  const _DrawerTab();

  @override
  Widget build(BuildContext context) {
    final harpyTheme = context.watch<FootballTheme>();

    return FootballTab(
      cardColor: harpyTheme.alternateCardColor,
      selectedCardColor: harpyTheme.primaryColor,
      selectedForegroundColor: harpyTheme.onPrimary,
      icon: const RotatedBox(
        quarterTurns: 1,
        child: Icon(FeatherIcons.barChart2),
      ),
    );
  }
}

class _CustomizeHomeTab extends StatelessWidget {
  const _CustomizeHomeTab();

  @override
  Widget build(BuildContext context) {
    final child = FootballButton.flat(
      padding: EdgeInsets.all(FootballTab.tabPadding(context)),
      icon: const Icon(FeatherIcons.settings),
      onTap: () => app<FootballNavigator>().pushHomeTabCustomizationScreen(
        model: context.read<HomeTabModel>(),
      ),
    );
    return child;
  }
}
