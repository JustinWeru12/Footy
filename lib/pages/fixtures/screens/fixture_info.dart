import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/classes/fixtures.dart';
import 'package:football/models/helper.dart';
import 'package:football/models/placeholder.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/classes/standings.dart' as st;
import 'package:football/services/theme/footy_theme.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../widgets/widgets.dart';

class FixtureInfo extends StatefulWidget {
  final Fixture fixture;
  final st.Standings standings;
  const FixtureInfo({Key? key, required this.fixture, required this.standings})
      : super(key: key);

  @override
  State<FixtureInfo> createState() => _FixtureInfoState();
}

class _FixtureInfoState extends State<FixtureInfo> {
  @override
  void initState() {
    super.initState();
    debugPrint(widget.standings.data!.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: FootballScaffold(
          title: "Fixture",
          body: Column(
            children: [
              const Divider(),
              header(),
              tabView(),
            ],
          )),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      // decoration: const BoxDecoration(color: kWhiteColor, boxShadow: [
      //   BoxShadow(color: Colors.grey, offset: Offset(5, 5), blurRadius: 7)
      // ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    border: Border.all(
                        width: 3.0, color: Theme.of(context).primaryColor),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 0),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: Helper.setWidth(context, factor: 0.15),
                      height: Helper.setWidth(context, factor: 0.15),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.fixture.localTeam!.data!.logoPath ??
                            "https://images.pexels.com/photos/3621104/pexels-photo-3621104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "${widget.fixture.localTeam!.data!.name ?? " "} vs. ${widget.fixture.visitorTeam!.data!.name ?? " "}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: "Comfortaa",
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    if (widget.fixture.scores!.htScore != null ||
                        widget.fixture.scores!.htScore != null) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "HT : FT",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: "Comfortaa",
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        "(${widget.fixture.scores?.htScore ?? " "}) ${widget.fixture.scores?.ftScore ?? " "}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: "Comfortaa",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    border: Border.all(
                        width: 3.0, color: Theme.of(context).primaryColor),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 0),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: Helper.setWidth(context, factor: 0.15),
                      height: Helper.setWidth(context, factor: 0.15),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.fixture.visitorTeam!.data!.logoPath ??
                            "https://images.pexels.com/photos/3621104/pexels-photo-3621104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          tabBar(),
          SizedBox(height: Helper.setHeight(context, factor: 0.01)),
        ],
      ),
    );
  }

  Widget tabBar() {
    TextStyle style = TextStyle(
        fontFamily: "Comfortaa",
        fontWeight: FontWeight.w700,
        fontSize: 15,
        color: Theme.of(context).colorScheme.background);
    return FootballTabBar(
      tabs: [
        FootballTab(
          icon: const Icon(
            FeatherIcons.tv,
            size: 18,
          ),
          selectedCardColor: Theme.of(context).primaryColor,
          selectedForegroundColor: Theme.of(context).colorScheme.background,
          text: Text(
            "TV Stations",
            style: style,
          ),
        ),
        FootballTab(
          icon: const Icon(
            FeatherIcons.info,
            size: 18,
          ),
          selectedCardColor: Theme.of(context).primaryColor,
          selectedForegroundColor: Theme.of(context).colorScheme.background,
          text: Text(
            "Info",
            style: style,
          ),
        ),
        FootballTab(
          icon: const Icon(
            Icons.table_chart_outlined,
            size: 18,
          ),
          selectedCardColor: Theme.of(context).primaryColor,
          selectedForegroundColor: Theme.of(context).colorScheme.background,
          text: Text(
            "Table",
            style: style,
          ),
        ),
      ],
    );
  }

  Widget tabView() {
    return SizedBox(
      height: Helper.setHeight(context, factor: 0.71),
      child: TabBarView(
        children: [
          stations(),
          info(),
          table(),
        ],
      ),
    );
  }

  Widget info() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer,
            infoItem(
              asset: "assets/icons/trophy.svg",
              title: "League",
              subtitle:
                  "${widget.fixture.league?.data?.name ?? ""}  -  Leg ${widget.fixture.leg ?? ""}",
            ),
            smallVerticalSpacer,
            infoItem(
              asset: "assets/icons/calendar.svg",
              title: "Date",
              subtitle: DateFormat('yyyy-MM-dd')
                  .format(widget.fixture.time!.startingAt!.date!),
            ),
            smallVerticalSpacer,
            infoItem(
              asset: "assets/icons/clock.svg",
              title: "Time",
              subtitle:
                  "${widget.fixture.time?.startingAt?.time?.substring(0, 5) ?? ""} - ${widget.fixture.time?.startingAt?.timezone ?? ""}",
            ),
            smallVerticalSpacer,
            infoItem(
              asset: "assets/icons/location2.svg",
              title: "Venue",
              subtitle: widget.fixture.venue!.data!.name ?? "",
            ),
            smallVerticalSpacer,
            infoItem(
              asset: "assets/icons/referee.svg",
              title: "Referee",
              subtitle: widget.fixture.referee?.data?.fullname ?? "Not found",
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget infoItem(
      {required String asset,
      required String title,
      required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: FootballListCard(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
              child: SvgPicture.asset(
                asset,
                fit: BoxFit.contain,
                color: Theme.of(context).primaryColor,
                height: 18,
                width: 18,
              ),
            ),
          ],
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontFamily: "Comfortaa",
              height: 1,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontFamily: "Comfortaa",
              height: 1,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget stations() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      // physics: const NeverScrollableScrollPhysics(),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            itemCount: widget.fixture.tvstations!.data!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return widget.fixture.tvstations!.data!.isNotEmpty
                  ? Container(
                      // padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(6.0),
                      decoration:
                          const BoxDecoration(borderRadius: kBorderRadius),
                      child: FootballListCard(
                        title: Text(
                          widget.fixture.tvstations!.data![i].tvstation!,
                          style: const TextStyle(
                            // color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        trailing: const Icon(
                          FeatherIcons.externalLink,
                          size: 20,
                        ),
                      ),
                    )
                  : const PlaceholderWidget(
                      label: "Sorry,No coverage listed for this fixture");
            }),
      ),
    );
  }

  Widget table() {
    var color = Theme.of(context).cardColor.withOpacity(0.6);
    var standings = widget
        .standings
        .data![widget.standings.data!.indexWhere(
            (element) => element.leagueId == widget.fixture.leagueId)]
        .standings!
        .data!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
        border: TableBorder(
          verticalInside: BorderSide(color: color),
          bottom: BorderSide(color: color),
          right: BorderSide(color: color),
        ),
        columnWidths: const {
          0: FlexColumnWidth(5),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
          4: FlexColumnWidth(1),
          5: FlexColumnWidth(1),
          6: FlexColumnWidth(1),
          7: FlexColumnWidth(1),
          8: FlexColumnWidth(1),
        },
        children: List<TableRow>.generate(
          standings.length + 1,
          (index) {
            return index == 0
                ? TableRow(
                    children: [
                      label("Club"),
                      label("MP"),
                      label("W"),
                      label("D"),
                      label("L"),
                      label("GF"),
                      label("GA"),
                      label("GD"),
                      label("Pts"),
                    ],
                  )
                : TableRow(
                    decoration: BoxDecoration(
                        border: index == 1
                            ? Border(top: BorderSide(color: color))
                            : const Border(
                                top: BorderSide(color: Colors.transparent)),
                        color: standings[index - 1].teamId ==
                                    widget.fixture.localteamId ||
                                standings[index - 1].teamId ==
                                    widget.fixture.visitorteamId
                            ? Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.5)
                            : index.isOdd
                                ? color.withOpacity(0.2)
                                : Colors.transparent),
                    children: [
                      rowItem(
                          "${standings[index - 1].position ?? " "}. ${standings[index - 1].teamName}"),
                      rowItem(
                          "${standings[index - 1].overall?.gamesPlayed ?? "_"}"),
                      rowItem("${standings[index - 1].overall?.won ?? "_"}"),
                      rowItem("${standings[index - 1].overall?.draw ?? "_"}"),
                      rowItem("${standings[index - 1].overall?.lost ?? "_"}"),
                      rowItem(
                          "${standings[index - 1].overall?.goalsScored ?? "_"}"),
                      rowItem(
                          "${standings[index - 1].overall?.goalsAgainst ?? "_"}"),
                      rowItem(
                          standings[index - 1].total?.goalDifference ?? "_"),
                      rowItem("${standings[index - 1].overall?.points ?? "_"}"),
                    ],
                  );
          },
          growable: false,
        ),
      ),
    );
  }

  Widget label(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(
        child: Text(text,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center),
      ),
    );
  }

  Widget rowItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Text(text,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.left),
    );
  }
}
