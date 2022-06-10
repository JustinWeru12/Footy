import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/classes/leagues.dart';
import 'package:football/models/helper.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/services/theme/footy_theme.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class LeagueCard extends StatefulWidget {
  const LeagueCard({
    Key? key,
    required this.league,
    this.onSaved,
  }) : super(key: key);
  final League league;
  final Function()? onSaved;
  @override
  State<LeagueCard> createState() => _LeagueCardState();
}

class _LeagueCardState extends State<LeagueCard> {
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
    showInSnackBar(context, "League Saved");
  }

  @override
  Widget build(BuildContext context) {
    final footyTheme = context.watch<FootballTheme>();
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: SizedBox(
        // height: Helper.setHeight(context, factor: 0.25),
        width: Helper.setWidth(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                // height: Helper.setHeight(context, factor: 0.2),
                margin: EdgeInsets.only(
                    left: Helper.setWidth(context, factor: 0.1)),
                padding: EdgeInsets.only(
                    left: Helper.setWidth(context, factor: 0.08)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: footyTheme.alternateCardColor,
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
                              "${widget.league.name}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: "Comfortaa",
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
                          "Type: ${widget.league.type}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "Comfortaa",
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      smallVerticalSpacer,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "${widget.league.season!.data!.name}",
                          style: const TextStyle(
                              fontFamily: "Comfortaa",
                              height: 1,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      smallVerticalSpacer,
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SvgPicture.string(
                              widget.league.country!.data!.extra!.flag!,
                              fit: BoxFit.fill,
                              height: 15,
                              width: 20,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "${widget.league.country!.data!.name} | ${widget.league.country!.data!.extra!.continent}",
                              style: const TextStyle(
                                  fontFamily: "Comfortaa",
                                  height: 1,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      smallVerticalSpacer,
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
                      image: widget.league.logoPath ??
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
    );
  }
}
