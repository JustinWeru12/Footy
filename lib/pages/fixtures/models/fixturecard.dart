import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/classes/fixtures.dart';
import 'package:football/models/helper.dart';
import 'package:football/pages/fixtures/screens/fixture_info.dart';
import 'package:intl/intl.dart';
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
        style: const TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      duration: const Duration(milliseconds: 1000),
    ));
  }

  onSaved(context) {
    showInSnackBar(context, "Fixture Saved");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Helper.scaleToPage(context, FixtureInfo(fixture: widget.fixture));
        },
        child: SizedBox(
          // height: Helper.setHeight(context, factor: 0.25),
          width: Helper.setWidth(context),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  // height: Helper.setHeight(context, factor: 0.2),
                  margin: EdgeInsets.symmetric(
                      horizontal: Helper.setWidth(context, factor: 0.1)),
                  padding: EdgeInsets.symmetric(
                      horizontal: Helper.setWidth(context, factor: 0.08)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Theme.of(context).colorScheme.secondary,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 0),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 6.0),
                          child: Row(
                            children: [
                              Text(
                                "${widget.fixture.localTeam!.data!.name ?? " "} vs. ${widget.fixture.visitorTeam!.data!.name ?? " "}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Leg:\t\t\t\t\t${widget.fixture.leg ?? ""}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
                              const SizedBox(width: 5),
                              Text(
                                "\t\t\t\t\t${DateFormat('yyyy-MM-dd').format(widget.fixture.time!.startingAt!.date!)}",
                                style: const TextStyle(
                                    height: 1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
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
                              Text(
                                "\t\t\t\t${widget.fixture.time!.startingAt!.time}",
                                style: const TextStyle(
                                    height: 1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.fixture.time!.startingAt!.timezone ?? "",
                                style: const TextStyle(
                                    height: 1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
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
                              const SizedBox(width: 5),
                              Text(
                                "\t\t\t\t\t${widget.fixture.venue!.data!.name ?? ""}",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    height: 1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                      ]),
                ),
              ),
              Align(
                alignment: const Alignment(-1, -0.6),
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
                alignment: const Alignment(1, -0.6),
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
