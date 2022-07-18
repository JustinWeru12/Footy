import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/api/crud.dart';
import 'package:football/classes/fixtures.dart';
import 'package:football/classes/head2head.dart';
import 'package:football/models/helper.dart';
import 'package:football/models/placeholder.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/classes/standings.dart' as st;
import 'package:football/services/theme/footy_theme.dart';
import 'package:football/widgets/footy_list_tile.dart';
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
  bool isPast = false;
  Head2Head _head2head = Head2Head();
  CrudMethods crudObj = CrudMethods();
  @override
  void initState() {
    isPast =
        widget.fixture.scores != null && widget.fixture.scores!.ftScore != null;
    crudObj
        .getHead2Head(widget.fixture.localteamId.toString(),
            widget.fixture.visitorteamId.toString())
        .then((val) {
      setState(() {
        _head2head = val;
      });
    });
    super.initState();
  }

  List<LineupDatum> getPlayerRow(int teamId) {
    return widget.fixture.lineup!.data!
        .where((element) => element.teamId == teamId)
        .toList();
  }

  String getPosition(Position? position) {
    switch (position) {
      case Position.G:
        return "Goalkeeper";
      case Position.D:
        return "Defender";
      case Position.M:
        return "Midfielder";
      case null:
        return "Player";
      default:
        return "Attacking Midfielder";
    }
  }

  List<String>? getLocallength() {
    return widget.fixture.formations?.localteamFormation
        ?.replaceAll(" ", "")
        .split("-");
  }

  List<String>? getVisitorlength() {
    return widget.fixture.formations?.visitorteamFormation
        ?.replaceAll(" ", "")
        .split("-");
  }

  int getLocalCurrIndex(int i) {
    switch (i) {
      case 0:
        return 1;
      case 1:
        return int.tryParse(getLocallength()![i - 1])! + 1;
      case 2:
        return int.tryParse(getLocallength()![i - 1])! +
            int.tryParse(getLocallength()![i - 2])! +
            1;
      case 3:
        return int.tryParse(getLocallength()![i - 1])! +
            int.tryParse(getLocallength()![i - 2])! +
            int.tryParse(getLocallength()![i - 3])! +
            1;
      case 4:
        return int.tryParse(getLocallength()![i - 1])! +
            int.tryParse(getLocallength()![i - 2])! +
            int.tryParse(getLocallength()![i - 3])! +
            int.tryParse(getLocallength()![i - 4])! +
            1;
      default:
        return int.tryParse(getLocallength()![i - 1])! +
            int.tryParse(getLocallength()![i - 2])! +
            int.tryParse(getLocallength()![i - 3])! +
            int.tryParse(getLocallength()![i - 4])! +
            int.tryParse(getLocallength()![i - 5])! +
            1;
    }
  }

  int getVisitorCurrIndex(int i) {
    switch (i) {
      case 0:
        return 1;
      case 1:
        return int.tryParse(getVisitorlength()![i - 1])! + 1;
      case 2:
        return int.tryParse(getVisitorlength()![i - 1])! +
            int.tryParse(getVisitorlength()![i - 2])! +
            1;
      case 3:
        return int.tryParse(getVisitorlength()![i - 1])! +
            int.tryParse(getVisitorlength()![i - 2])! +
            int.tryParse(getVisitorlength()![i - 3])! +
            1;
      case 4:
        return int.tryParse(getVisitorlength()![i - 1])! +
            int.tryParse(getVisitorlength()![i - 2])! +
            int.tryParse(getVisitorlength()![i - 3])! +
            int.tryParse(getVisitorlength()![i - 4])! +
            1;
      default:
        return int.tryParse(getVisitorlength()![i - 1])! +
            int.tryParse(getVisitorlength()![i - 2])! +
            int.tryParse(getVisitorlength()![i - 3])! +
            int.tryParse(getVisitorlength()![i - 4])! +
            int.tryParse(getVisitorlength()![i - 5])! +
            1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: FootballScaffold(
          title: "Fixture",
          body: SizedBox(
            height: Helper.setHeight(context),
            child: Column(
              children: [
                header(),
                tabView(),
              ],
            ),
          )),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            width: Helper.setWidth(context),
            child: Row(
              children: [
                Container(
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
                      width: Helper.setWidth(context, factor: 0.13),
                      height: Helper.setWidth(context, factor: 0.13),
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
                    SizedBox(
                      width: Helper.setWidth(context, factor: 0.57),
                      child: Text(
                        "${widget.fixture.localTeam!.data!.name ?? " "} vs. ${widget.fixture.visitorTeam!.data!.name ?? " "}",
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: "Comfortaa",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
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
                      width: Helper.setWidth(context, factor: 0.13),
                      height: Helper.setWidth(context, factor: 0.13),
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
          // SizedBox(height: Helper.setHeight(context, factor: 0.01)),
        ],
      ),
    );
  }

  Widget tabBar() {
    return FootballTabBar(
      tabs: [
        const FootballTab(
          icon: Icon(
            FeatherIcons.tv,
            size: 18,
          ),
          text: Text(
            "TV Stations",
          ),
        ),
        const FootballTab(
          icon: Icon(
            FeatherIcons.info,
            size: 18,
          ),
          text: Text(
            "Info",
          ),
        ),
        const FootballTab(
          icon: Icon(
            Icons.table_chart_outlined,
            size: 18,
          ),
          text: Text(
            "Table",
          ),
        ),
        const FootballTab(
          icon: Icon(
            Icons.people_alt_outlined,
            size: 18,
          ),
          text: Text(
            "Lineup",
          ),
        ),
        const FootballTab(
          icon: Icon(
            FeatherIcons.activity,
            size: 18,
          ),
          text: Text(
            "Events",
          ),
        ),
        const FootballTab(
          icon: Icon(
            FeatherIcons.barChart2,
            size: 18,
          ),
          text: Text(
            "Stats",
          ),
        ),
        FootballTab(
          icon: SvgPicture.asset(
            "assets/icons/h2h.svg",
            height: 16,
            width: 16,
            color: Theme.of(context).iconTheme.color,
          ),
          text: const Text(
            "Head2Head",
          ),
        ),
      ],
    );
  }

  Widget tabView() {
    return Expanded(
      child: TabBarView(
        children: [
          stations(),
          info(),
          table(),
          lineup(),
          events(),
          stats(),
          h2hinfo(),
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
                      label: "Sorry, no coverage listed for this fixture.");
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
                      label("M"),
                      label("W"),
                      label("D"),
                      label("L"),
                      label("GF"),
                      label("GA"),
                      label("GD"),
                      label("Pt"),
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
            style: Theme.of(context).textTheme.bodySmall,
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

  Widget lineup() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      // physics: const NeverScrollableScrollPhysics(),
      child: widget.fixture.lineup!.data!.isNotEmpty
          ? Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: kBorderRadius,
                    child: SvgPicture.asset(
                      "assets/icons/pitch.svg",
                      width: Helper.setWidth(context),
                      height: Helper.setWidth(context) * 2,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: Helper.setWidth(context) * 2,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Helper.setWidth(context) * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            formation(
                                widget.fixture.formations?.localteamFormation ??
                                    ""),
                            smallVerticalSpacer,
                            lineUpRow(1, 0,
                                getPlayerRow(widget.fixture.localteamId!)),
                            ...List.generate(
                              widget.fixture.formations!.localteamFormation!
                                  .split("-")
                                  .length,
                              (int i) => lineUpRow(
                                  int.tryParse(getLocallength()![i])!,
                                  getLocalCurrIndex(i),
                                  getPlayerRow(widget.fixture.localteamId!)),
                            ),
                            smallVerticalSpacer,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Helper.setWidth(context) * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            smallVerticalSpacer,
                            ...List.generate(
                              widget.fixture.formations!.visitorteamFormation!
                                  .split("-")
                                  .length,
                              (int i) => lineUpRow(
                                  int.tryParse(getVisitorlength()![i])!,
                                  getVisitorCurrIndex(i),
                                  getPlayerRow(widget.fixture.visitorteamId!)),
                            ).reversed,
                            lineUpRow(1, 0,
                                getPlayerRow(widget.fixture.visitorteamId!)),
                            smallVerticalSpacer,
                            formation(widget
                                    .fixture.formations?.visitorteamFormation ??
                                ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const PlaceholderWidget(
              label: "Sorry, lineup not available for this fixture yet."),
    );
  }

  Widget formation(String title) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "Comfortaa",
          ),
        ),
      ),
    );
  }

  Widget lineUpRow(int length, int start, List<LineupDatum> players) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        length,
        (int i) => player(players[i + start]),
      ),
    );
  }

  Widget player(LineupDatum element) {
    bool isLocal = element.teamId == widget.fixture.localteamId;
    return Column(
      children: [
        SizedBox(
          height: Helper.setWidth(context, factor: 0.1),
          width: Helper.setWidth(context, factor: 0.1),
          child: Stack(
            children: [
              Container(
                height: Helper.setWidth(context, factor: 0.1),
                width: Helper.setWidth(context, factor: 0.1),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white.withOpacity(1)),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipOval(
                    // radius: Helper.setWidth(context, factor: 0.12),
                    child: SvgPicture.asset(
                      "assets/icons/person.svg",
                      height: Helper.setWidth(context, factor: 0.12),
                      width: Helper.setWidth(context, factor: 0.12),
                      color: isLocal
                          ? Color(int.parse((widget
                                  .fixture.colors?.localteam?.color
                                  ?.replaceAll('#', '0xff')) ??
                              "0xFF000000"))
                          : Color(int.parse((widget
                                  .fixture.colors?.visitorteam?.color
                                  ?.replaceAll('#', '0xff')) ??
                              "0xFF000000")),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              if (element.captain!)
                Align(
                  alignment: const Alignment(1, 1),
                  child: Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "C",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Comfortaa",
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            element.playerName!.contains("")
                ? element.playerName?.split(" ").first ?? ""
                : element.playerName ?? "",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: "Comfortaa",
            ),
          ),
        ),
      ],
    );
  }

  Widget events() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      // physics: const NeverScrollableScrollPhysics(),
      child: widget.fixture.events!.data!.isNotEmpty
          ? MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  itemCount: widget.fixture.events!.data!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: true,
                  itemBuilder: (context, i) {
                    return getEventWidget(widget.fixture.events!.data![i].type,
                        widget.fixture.events!.data![i]);
                  }),
            )
          : const PlaceholderWidget(
              label: "Sorry, no events listed for this fixture."),
    );
  }

  Widget getEventWidget(PurpleType? purpleType, EventsDatum event) {
    switch (purpleType) {
      case PurpleType.GOAL:
        return eventCard(
            event.playerName ?? "",
            event.relatedPlayerName != null
                ? "(${event.relatedPlayerName})"
                : "",
            "${event.minute ?? ""}'",
            "assets/icons/football.svg",
            Theme.of(context).cardColor,
            event.teamId == widget.fixture.localteamId.toString());
      case PurpleType.OWN_GOAL:
        return eventCard(
            event.playerName ?? "",
            "(OG)",
            "${event.minute ?? ""}'",
            "assets/icons/football.svg",
            Theme.of(context).cardColor,
            event.teamId == widget.fixture.localteamId.toString());
      case PurpleType.PENALTY:
        return eventCard(
            event.playerName ?? "",
            event.result ?? "",
            "${event.minute ?? ""}'",
            "assets/icons/penalty.svg",
            Theme.of(context).cardColor,
            event.teamId == widget.fixture.localteamId.toString());
      case PurpleType.REDCARD:
        return eventCard(
            event.playerName ?? "",
            event.reason ?? "",
            "${event.minute ?? ""}'",
            "assets/icons/redcard.svg",
            null,
            event.teamId == widget.fixture.localteamId.toString());

      case PurpleType.SUBSTITUTION:
        return substitutionCard(
            event.playerName ?? "",
            event.relatedPlayerName ?? "",
            "${event.minute ?? ""}'",
            "assets/icons/substitution.svg",
            const Color(0xFF23DE71),
            const Color(0xFFFE0000),
            event.teamId == widget.fixture.localteamId.toString());

      case PurpleType.VAR:
        return eventCard(
            event.playerName ?? "",
            event.relatedPlayerName ?? "",
            "${event.minute ?? ""}'",
            "assets/icons/tv.svg",
            Theme.of(context).cardColor,
            event.teamId == widget.fixture.localteamId.toString());
      case PurpleType.YELLOWCARD:
        return eventCard(
            event.playerName ?? event.relatedPlayerName ?? "",
            event.reason ?? "",
            "${event.minute ?? ""}'",
            "assets/icons/yellowcard.svg",
            null,
            event.teamId == widget.fixture.localteamId.toString());

      case PurpleType.YELLOWRED:
        return eventCard(
            event.playerName ?? "",
            event.reason ?? "",
            "${event.minute ?? ""}'",
            "assets/icons/yellowred.svg",
            null,
            event.teamId == widget.fixture.localteamId.toString());

      default:
        return Container();
    }
  }

  Widget eventCard(String title, String subTitle, String time, String asset,
      Color? color, bool isHome) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        width: Helper.setWidth(context),
        child: FootballListCard(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              isHome
                  ? SizedBox(
                      width: Helper.setWidth(context, factor: 0.45),
                      child: FootballListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 16),
                        leading: SvgPicture.asset(
                          asset,
                          fit: BoxFit.contain,
                          color: color,
                          height: 20,
                          width: 20,
                        ),
                        title: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        subtitle: Text(
                          subTitle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: Helper.setWidth(context, factor: 0.45),
                    ),
              Expanded(
                child: Center(
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Comfortaa",
                    ),
                  ),
                ),
              ),
              !isHome
                  ? SizedBox(
                      width: Helper.setWidth(context, factor: 0.45),
                      child: FootballListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 16),
                        leading: SvgPicture.asset(
                          asset,
                          fit: BoxFit.contain,
                          color: color,
                          height: 20,
                          width: 20,
                        ),
                        title: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                        subtitle: Text(
                          subTitle,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: Helper.setWidth(context, factor: 0.45),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget substitutionCard(String title, String subTitle, String time,
      String asset, Color primary, Color secondary, bool isHome) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        width: Helper.setWidth(context),
        child: FootballListCard(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              isHome
                  ? SizedBox(
                      width: Helper.setWidth(context, factor: 0.45),
                      child: FootballListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 16),
                        leading: Center(
                          child: SvgPicture.asset(
                            asset,
                            fit: BoxFit.contain,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        title: Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                            color: primary,
                          ),
                        ),
                        subtitle: Text(
                          subTitle,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                            color: secondary,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: Helper.setWidth(context, factor: 0.45),
                    ),
              Expanded(
                child: Center(
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Comfortaa",
                    ),
                  ),
                ),
              ),
              !isHome
                  ? SizedBox(
                      width: Helper.setWidth(context, factor: 0.45),
                      child: FootballListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 16),
                        leading: SvgPicture.asset(
                          asset,
                          fit: BoxFit.contain,
                          height: 20,
                          width: 20,
                        ),
                        title: Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                            color: primary,
                          ),
                        ),
                        subtitle: Text(
                          subTitle,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                            color: secondary,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: Helper.setWidth(context, factor: 0.45),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stats() {
    if (widget.fixture.stats != null &&
        widget.fixture.stats!.data!.isNotEmpty) {
      List<StatsDatum> homeStat = widget.fixture.stats!.data!
          .where((element) => element.teamId == widget.fixture.localteamId)
          .toList();
      List<StatsDatum> awayStat = widget.fixture.stats!.data!
          .where((element) => element.teamId == widget.fixture.visitorteamId)
          .toList();
      return SingleChildScrollView(
          child: Column(
        children: [
          statItem(homeStat[0].shots?.total?.toString() ?? "_", "Shots",
              awayStat[0].shots?.total?.toString() ?? "_"),
          statItem(homeStat[0].shots?.ongoal?.toString() ?? "_",
              "Shots on Target", awayStat[0].shots?.ongoal?.toString() ?? "_"),
          statItem("${homeStat[0].possessiontime ?? "_"}%", "Possesion",
              "${awayStat[0].possessiontime ?? "_"}%"),
          statItem(homeStat[0].passes?.total?.toString() ?? "_", "Passes",
              awayStat[0].passes?.total?.toString() ?? "_"),
          statItem(
              "${homeStat[0].passes?.percentage?.round() ?? "_"}%",
              "Pass Accuracy",
              "${awayStat[0].passes?.percentage?.round() ?? "_"}%"),
          statItem(homeStat[0].fouls?.toString() ?? "_", "Fouls",
              awayStat[0].fouls?.toString() ?? "_"),
          statItem(homeStat[0].yellowcards?.toString() ?? "_", "Yellow cards",
              awayStat[0].yellowcards?.toString() ?? "_"),
          statItem(homeStat[0].redcards?.toString() ?? "_", "Red Cards",
              awayStat[0].redcards?.toString() ?? "_"),
          statItem(homeStat[0].offsides?.toString() ?? "_", "Offsides",
              awayStat[0].offsides?.toString() ?? "_"),
          statItem(homeStat[0].corners?.toString() ?? "_", "Corners",
              awayStat[0].corners?.toString() ?? "_"),
          statItem(homeStat[0].penalties?.toString() ?? "_", "Penalty Kicks",
              awayStat[0].penalties?.toString() ?? "_"),
        ],
      ));
    } else {
      return const PlaceholderWidget(
          label: "Sorry, stats not availble for this match");
    }
  }

  Widget statItem(String team1, String title, String team2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: FootballListCard(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                team1,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Comfortaa",
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Comfortaa",
                ),
              ),
              Text(
                team2,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Comfortaa",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget h2hinfo() {
    if (_head2head.data != null && _head2head.data!.isNotEmpty) {
      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _head2head.data!.length,
          itemBuilder: (context, i) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: FootballListCard(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Helper.setWidth(context, factor: 0.35),
                      child: Center(
                        child: Text(
                          teamName(_head2head.data?[i].localteamId),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                            color: isWinner(_head2head.data?[i].localteamId,
                                    _head2head.data?[i].winnerTeamId)
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          _head2head.data?[i].scores?.ftScore ?? "TBD",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Helper.setWidth(context, factor: 0.35),
                      child: Center(
                        child: Text(
                          teamName(_head2head.data?[i].visitorteamId),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Comfortaa",
                            color: isWinner(_head2head.data?[i].visitorteamId,
                                    _head2head.data?[i].winnerTeamId)
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      DateFormat('yyyy-MM-dd  HH:MM').format(
                          _head2head.data![i].time!.startingAt!.dateTime!),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Comfortaa",
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const PlaceholderWidget(
          label: "Sorry, Head 2 Head information not Available");
    }
  }

  String teamName(int? id) {
    if (id == widget.fixture.localteamId) {
      return widget.fixture.localTeam?.data?.name ?? "";
    } else if (id == widget.fixture.visitorteamId) {
      return widget.fixture.visitorTeam?.data?.name ?? "";
    } else {
      return "";
    }
  }

  bool isWinner(int? id, int? winner) {
    if (id == winner) {
      return true;
    } else {
      return false;
    }
  }
}
