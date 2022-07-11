import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/classes/fixtures.dart';
import 'package:football/models/helper.dart';
import 'package:football/pages/fixtures/screens/fixture_info.dart';
import 'package:football/services/theme/footy_theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class FixtureCard extends StatefulWidget {
  const FixtureCard({
    Key? key,
    required this.fixture,
    this.onSaved,
  }) : super(key: key);
  final Fixture fixture;
  final Function()? onSaved;
  @override
  State<FixtureCard> createState() => _FixtureCardState();
}

class _FixtureCardState extends State<FixtureCard> {
  showInSnackBar(context, value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        value,
        style: const TextStyle(
            fontFamily: "Comfortaa", fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      duration: const Duration(milliseconds: 1000),
    ));
  }

  onSaved(context) {
    showInSnackBar(context, "Fixture Saved");
  }

  List<String> getStations(List<TvstationsDatum> stations) {
    List<String> names = [];
    for (int i = 0; i < stations.length; i++) {
      names.add(stations[i].tvstation!);
    }
    return names;
  }

  @override
  Widget build(BuildContext context) {
    final footyTheme = context.watch<FootballTheme>();
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Helper.slideToPage(context, FixtureInfo(fixture: widget.fixture));
        },
        child: SizedBox(
          height: 200,
          width: Helper.setWidth(context),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Theme.of(context).cardTheme.color,
                  type: MaterialType.transparency,
                  child: Container(
                    // height: Helper.setHeight(context, factor: 0.2),
                    margin: EdgeInsets.symmetric(
                        horizontal: Helper.setWidth(context, factor: 0.05)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: footyTheme.alternateCardColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x40FFFFFF),
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 6.0),
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                "${widget.fixture.localTeam!.data!.name ?? " "} vs. ${widget.fixture.visitorTeam!.data!.name ?? " "}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (() {
                                  widget.onSaved ?? onSaved(context);
                                }),
                                child: SvgPicture.asset(
                                  "assets/icons/save.svg",
                                  fit: BoxFit.contain,
                                  color: Theme.of(context).primaryColor,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  Helper.setWidth(context, factor: 0.13)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    "Leg:  ${widget.fixture.leg ?? ""}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/calendar.svg",
                                        fit: BoxFit.contain,
                                        color: Theme.of(context).primaryColor,
                                        height: 20,
                                        width: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        DateFormat('dd/MM/yyyy').format(widget
                                            .fixture.time!.startingAt!.date!),
                                        style: const TextStyle(
                                          fontFamily: "Comfortaa",
                                          height: 1,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        widget.fixture.time!.startingAt!.time!
                                            .substring(0, 5),
                                        style: const TextStyle(
                                          fontFamily: "Comfortaa",
                                          height: 1,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        widget.fixture.time!.startingAt!
                                                .timezone ??
                                            "",
                                        style: const TextStyle(
                                          fontFamily: "Comfortaa",
                                          height: 1,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/location2.svg",
                                        fit: BoxFit.contain,
                                        color: Theme.of(context).primaryColor,
                                        height: 20,
                                        width: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      SizedBox(
                                        width: Helper.setWidth(context,
                                            factor: 0.46),
                                        child: Text(
                                          widget.fixture.venue!.data!.name ??
                                              "",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: "Comfortaa",
                                            height: 1,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Divider(),
                              ]),
                        ),
                        widget.fixture.tvstations!.data!.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 0.0, 8.0, 8.0),
                                child: Text(
                                  getStations(widget.fixture.tvstations!.data!)
                                      .join(" | "),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontFamily: "Comfortaa",
                                    height: 1.5,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "No TV channels listed for this fixture",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: "Comfortaa",
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-1, -0.4),
                child: Container(
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
              ),
              Align(
                alignment: const Alignment(1, -0.4),
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
