import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/classes/fixtures.dart';
import 'package:football/models/helper.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/widgets/footy_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../widgets/widgets.dart';

class FixtureInfo extends StatefulWidget {
  final Fixture fixture;
  const FixtureInfo({Key? key, required this.fixture}) : super(key: key);

  @override
  State<FixtureInfo> createState() => _FixtureInfoState();
}

class _FixtureInfoState extends State<FixtureInfo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
      ],
    );
  }

  Widget tabView() {
    return SizedBox(
      height: Helper.setHeight(context, factor: 0.71),
      child: TabBarView(
        children: [
          info(),
          stations(),
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/trophy.svg",
                    fit: BoxFit.contain,
                    color: Theme.of(context).primaryColor,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.fixture.league?.data?.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: "Comfortaa",
                        height: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "-  Leg ${widget.fixture.leg ?? ""}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: "Comfortaa",
                        height: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            smallVerticalSpacer,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/calendar.svg",
                    fit: BoxFit.contain,
                    color: Theme.of(context).primaryColor,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat('yyyy-MM-dd')
                        .format(widget.fixture.time!.startingAt!.date!),
                    style: const TextStyle(
                        fontFamily: "Comfortaa",
                        height: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            smallVerticalSpacer,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/clock.svg",
                    fit: BoxFit.contain,
                    color: Theme.of(context).primaryColor,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.fixture.time!.startingAt!.time ?? "",
                    style: const TextStyle(
                        fontFamily: "Comfortaa",
                        height: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.fixture.time!.startingAt!.timezone ?? "",
                    style: const TextStyle(
                        fontFamily: "Comfortaa",
                        height: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            smallVerticalSpacer,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/location2.svg",
                    fit: BoxFit.contain,
                    color: Theme.of(context).primaryColor,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.fixture.venue!.data!.name ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: "Comfortaa",
                        height: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            smallVerticalSpacer,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/referee.svg",
                    fit: BoxFit.contain,
                    color: Theme.of(context).primaryColor,
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.fixture.referee?.data?.fullname ?? "Not found",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontFamily: "Comfortaa",
                        height: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
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
              return Container(
                // padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
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
              );
            }),
      ),
    );
  }
}
