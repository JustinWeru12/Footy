import 'package:flutter/material.dart';
import 'package:football/api/crud.dart';
import 'package:football/classes/fixtures.dart' as fixture;
import 'package:football/classes/leagues.dart';
import 'package:football/classes/standings.dart' as st;
import 'package:football/models/helper.dart';
import 'package:football/models/placeholder.dart';
import 'package:football/pages/leagues/fixture_by_league.dart';
import 'package:football/pages/leagues/models/leaguecard.dart';
import 'package:football/widgets/footy_scaffold.dart';
import 'package:intl/intl.dart';

class LeaguePage extends StatefulWidget {
  final st.Standings standings;
  final LeagueList leagues;
  const LeaguePage({Key? key, required this.standings, required this.leagues})
      : super(key: key);

  @override
  State<LeaguePage> createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  CrudMethods crudObj = CrudMethods();
  Future<fixture.FixtureList>? fixtures;
  LeagueList? leagues;
  String sDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String eDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().add(const Duration(days: 6)));

  @override
  void initState() {
    setState(() {
      leagues = widget.leagues;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FootballScaffold(
        title: "Leagues",
        body: Column(
          children: [
            leagues!.data.isNotEmpty
                ? MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        itemCount: leagues!.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              if (fixtures != null) {
                                Helper.slideToPage(
                                    context,
                                    FixtureByLeaguePage(
                                      league: leagues!.data[i],
                                      fixtures: fixtures!,
                                      standings: widget.standings,
                                    ));
                              } else {
                                setState(() {
                                  fixtures = crudObj.getFixturebyDateRange(
                                      sDate, eDate);
                                  fixtures!
                                      .whenComplete(() => Helper.slideToPage(
                                          context,
                                          FixtureByLeaguePage(
                                            league: leagues!.data[i],
                                            fixtures: fixtures!,
                                            standings: widget.standings,
                                          )));
                                });
                              }
                            },
                            child: LeagueCard(league: leagues!.data[i]),
                          );
                        }),
                  )
                : const PlaceholderWidget(label: "Sorry, no leagues to show"),
          ],
        ));
  }
}
