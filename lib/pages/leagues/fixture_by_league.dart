import 'package:flutter/material.dart';
import 'package:football/classes/fixtures.dart' as fixture;
import 'package:football/classes/leagues.dart';
import 'package:football/classes/standings.dart' as st;
import 'package:football/models/helper.dart';
import 'package:football/models/placeholder.dart';
import 'package:football/pages/fixtures/models/fixturecard.dart';
import 'package:football/widgets/footy_scaffold.dart';
import 'package:rive/rive.dart';

class FixtureByLeaguePage extends StatefulWidget {
  final Future<fixture.FixtureList> fixtures;
  final st.Standings standings;
  final League league;
  const FixtureByLeaguePage({
    Key? key,
    required this.fixtures,
    required this.league,
    required this.standings,
  }) : super(key: key);

  @override
  State<FixtureByLeaguePage> createState() => _FixtureByLeaguePageState();
}

class _FixtureByLeaguePageState extends State<FixtureByLeaguePage> {
  @override
  Widget build(BuildContext context) {
    return FootballScaffold(
        title: widget.league.name,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FutureBuilder<fixture.FixtureList>(
                  future: widget.fixtures,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.data
                              .where((element) =>
                                  element.league!.data!.id == widget.league.id)
                              .isNotEmpty
                          ? MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.data
                                      .where((element) =>
                                          element.league!.data!.id ==
                                          widget.league.id)
                                      .length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return snapshot.data!.data[i].league!.data!
                                                .id ==
                                            widget.league.id
                                        ? FixtureCard(
                                            fixture: snapshot.data!.data[i],
                                            standings: widget.standings,
                                          )
                                        : Container();
                                  }),
                            )
                          : const PlaceholderWidget(
                              label:
                                  "Sorry, no spcoming fixtures for this league",
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
                                style: TextStyle(
                                    fontFamily: "Comfortaa", fontSize: 20)),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
