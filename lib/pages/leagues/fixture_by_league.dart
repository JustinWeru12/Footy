import 'package:flutter/material.dart';
import 'package:football/classes/fixtures.dart' as Fixture;
import 'package:football/classes/leagues.dart';
import 'package:football/models/helper.dart';
import 'package:football/pages/fixtures/models/fixturecard.dart';
import 'package:football/widgets/footy_scaffold.dart';
import 'package:rive/rive.dart';

class FixtureByLeaguePage extends StatefulWidget {
  final Future<Fixture.FixtureList> fixtures;
  final League league;
  const FixtureByLeaguePage(
      {Key? key, required this.fixtures, required this.league})
      : super(key: key);

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
                FutureBuilder<Fixture.FixtureList>(
                  future: widget.fixtures,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.data.isNotEmpty
                          ? MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: snapshot.data!.data.isEmpty
                                  ? const Center(
                                      child: Text(
                                          "No Upcoming Fixtures for this league",
                                          style: TextStyle(fontSize: 20)),
                                    )
                                  : ListView.builder(
                                      itemCount: snapshot.data!.data.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, i) {
                                        return FixtureCard(
                                            fixture: snapshot.data!.data[i]);
                                      }),
                            )
                          : const Center(
                              child: Text(
                                  "No Upcoming Fixtures for this League",
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
            ),
          ),
        ));
  }
}
