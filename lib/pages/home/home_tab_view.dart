import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/api/crud.dart';
import 'package:football/classes/fixtures.dart';
import 'package:football/classes/leagues.dart';
import 'package:football/classes/standings.dart' as st;
import 'package:football/pages/fixtures/screens/fixtures_page.dart';
import 'package:football/pages/home/models/home_app_bar.dart';
import 'package:football/pages/home/models/home_drawer.dart';
import 'package:football/pages/home/models/home_tab_entry.dart';
import 'package:football/pages/home/models/home_tab_model.dart';
import 'package:football/services/config_cubit.dart';
import 'package:football/services/scroll_direction_listener.dart';
import 'package:football/services/user_auth/authentication.dart';
import 'package:football/services/user_auth/user.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView(
      {Key? key,
      this.auth,
      required this.logoutCallback,
      required this.userData})
      : super(key: key);

  static const _indexOffset = 3;
  final BaseAuth? auth;
  final VoidCallback logoutCallback;
  final UserData userData;

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  CrudMethods crudObj = CrudMethods();
  Future<FixtureList>? fixtures;
  LeagueList? leagues = LeagueList(data: []);
  var standings = st.Standings(data: []);
  String sDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().subtract(const Duration(days: 2)));
  String eDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().add(const Duration(days: 6)));

  @override
  void initState() {
    fixtures = crudObj.getFixturebyDateRange(sDate, eDate);
    crudObj.getLeagues().then((value) => {
          setState(() {
            leagues = value;
          }),
          for (int i = 0; i < value.data.length; i++)
            {
              crudObj
                  .getStrandingsbySeasonID(
                      value.data[i].currentSeasonId.toString())
                  .then(
                    (val) => setState(() {
                      standings.data!.add(val.data![0]);
                    }),
                  )
            }
        });
    super.initState();
  }

  Widget _mapEntryContent(
    int index,
    HomeTabEntry entry,
    double refreshIndicatorOffset,
  ) {
    if (entry.isDefaultType) {
      switch (entry.id) {
        case '-2 days':
          return FixturesPage(
            fixtures: fixtures!,
            standings: standings,
            date: DateTime.now().subtract(
              const Duration(days: 2),
            ),
          );
        case '-1 day':
          return FixturesPage(
              fixtures: fixtures!,
              standings: standings,
              date: DateTime.now().subtract(
                const Duration(days: 1),
              ));
        case 'today':
          return FixturesPage(
            fixtures: fixtures!,
            standings: standings,
            date: DateTime.now(),
          );
        case 'tomorrow':
          return FixturesPage(
            fixtures: fixtures!,
            standings: standings,
            date: DateTime.now().add(const Duration(days: 1)),
          );
        case '2 days':
          return FixturesPage(
            fixtures: fixtures!,
            standings: standings,
            date: DateTime.now().add(const Duration(days: 2)),
          );
        case '3 days':
          return FixturesPage(
            fixtures: fixtures!,
            standings: standings,
            date: DateTime.now().add(const Duration(days: 3)),
          );
        case '4 days':
          return FixturesPage(
            fixtures: fixtures!,
            standings: standings,
            date: DateTime.now().add(const Duration(days: 4)),
          );
        case '5 days':
          return FixturesPage(
            fixtures: fixtures!,
            standings: standings,
            date: DateTime.now().add(const Duration(days: 5)),
          );
        case '6 days':
          return FixturesPage(
            fixtures: fixtures!,
            standings: standings,
            date: DateTime.now().add(const Duration(days: 6)),
          );
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
      initialIndex: HomeTabView._indexOffset,
      child: _HomeTabListener(
        child: Stack(
          children: [
            TabBarView(
              children: [
                HomeDrawer(
                  auth: widget.auth,
                  logoutCallback: widget.logoutCallback,
                  userData: widget.userData,
                  standings: standings,
                  leagues: leagues!,
                ),
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
