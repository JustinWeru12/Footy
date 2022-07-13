import 'package:flutter/material.dart';
import 'package:football/classes/fixtures.dart';
import 'package:football/classes/standings.dart' as st;
import 'package:football/models/helper.dart';
import 'package:football/models/placeholder.dart';
import 'package:football/pages/fixtures/models/fixturecard.dart';
import 'package:football/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class FixturesPage extends StatefulWidget {
  final Future<FixtureList> fixtures;
  final st.Standings standings;
  final DateTime date;

  const FixturesPage(
      {Key? key,
      required this.fixtures,
      required this.date,
      required this.standings})
      : super(key: key);

  @override
  State<FixturesPage> createState() => _FixturesPageState();
}

class _FixturesPageState extends State<FixturesPage> {
  @override
  void initState() {
    super.initState();
  }

  bool isThisDate(AsyncSnapshot<FixtureList> snapshot, int i) {
    return DateFormat('yyyy-MM-dd').format(widget.date) ==
        DateFormat('yyyy-MM-dd')
            .format(snapshot.data!.data[i].time!.startingAt!.date!);
  }

  bool isEmpty(AsyncSnapshot<FixtureList> snapshot) {
    return snapshot.data!.data
        .where(
          (element) =>
              DateFormat('yyyy-MM-dd')
                  .format(element.time!.startingAt!.date!) ==
              DateFormat('yyyy-MM-dd').format(widget.date),
        )
        .isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FootballScaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Helper.setHeight(context, factor: 0.12)),
            FutureBuilder<FixtureList>(
              future: widget.fixtures,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.data.isNotEmpty
                      ? MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: isEmpty(snapshot)
                              ? Center(
                                  child: Text("No Fixtures for this Date",
                                      style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                )
                              : ListView.builder(
                                  itemCount: snapshot.data!.data.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return isThisDate(snapshot, i)
                                        ? FixtureCard(
                                            fixture: snapshot.data!.data[i],
                                            standings: widget.standings,
                                          )
                                        : Container();
                                  }),
                        )
                      : const PlaceholderWidget(
                          label: "Sorry, no fixtures for this day");
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
                        Text(
                          "Loading....",
                          style: TextStyle(
                              fontFamily: "Comfortaa",
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
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
