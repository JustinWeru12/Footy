import 'package:flutter/material.dart';
import 'package:football/api/crud.dart';
import 'package:football/classes/fixtures.dart' as fixture;
import 'package:football/classes/leagues.dart';
import 'package:football/models/helper.dart';
import 'package:football/pages/leagues/fixture_by_league.dart';
import 'package:football/pages/leagues/models/leaguecard.dart';
import 'package:football/widgets/footy_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class LeaguePage extends StatefulWidget {
  const LeaguePage({Key? key}) : super(key: key);

  @override
  State<LeaguePage> createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  Future<LeagueList>? leagues;
  CrudMethods crudObj = CrudMethods();
  Future<fixture.FixtureList>? fixtures;
  String sDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String eDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().add(const Duration(days: 6)));

  @override
  void initState() {
    setState(() {
      leagues = crudObj.getLeagues();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FootballScaffold(
        title: "Leagues",
        body: Column(
          children: [
            FutureBuilder<LeagueList>(
              future: leagues,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.data.isNotEmpty
                      ? MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: snapshot.data!.data.isEmpty
                              ? const Center(
                                  child: Text("No Leagues",
                                      style: TextStyle(fontSize: 20)),
                                )
                              : ListView.builder(
                                  itemCount: snapshot.data!.data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return InkWell(
                                      onTap: () {
                                        if (fixtures != null) {
                                          Helper.slideToPage(
                                              context,
                                              FixtureByLeaguePage(
                                                  league:
                                                      snapshot.data!.data[i],
                                                  fixtures: fixtures!));
                                        } else {
                                          setState(() {
                                            fixtures =
                                                crudObj.getFixturebyDateRange(
                                                    sDate, eDate);
                                            fixtures!.whenComplete(() =>
                                                Helper.slideToPage(
                                                    context,
                                                    FixtureByLeaguePage(
                                                        league: snapshot
                                                            .data!.data[i],
                                                        fixtures: fixtures!)));
                                          });
                                        }
                                      },
                                      child: LeagueCard(
                                          league: snapshot.data!.data[i]),
                                    );
                                  }),
                        )
                      : const Center(
                          child: Text("No Leagues",
                              style: TextStyle(fontSize: 20)),
                        );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString(),
                        style: const TextStyle(fontSize: 20)),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Helper.setHeight(context, factor: 0.15),
                          width: Helper.setHeight(context, factor: 0.15),
                          child: const Center(
                            child: RiveAnimation.asset(
                              'assets/rive/animated_icon.riv',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const Text("Loading....",
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }
}
