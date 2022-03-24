import 'package:flutter/material.dart';
import 'package:football/widgets/widgets.dart';

class EnglishPremier extends StatefulWidget {
  const EnglishPremier({Key? key}) : super(key: key);

  @override
  State<EnglishPremier> createState() => _EnglishPremierState();
}

class _EnglishPremierState extends State<EnglishPremier> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(
            height: 6,
          ),
          StreamItem(
              title: "Hull City vs Lecister City",
              subtitle: "Sky Sport C1/HD UK| BBC Radio\n5 Live| Sky Go UK",
              alarm: "Mon 13 Aug 03:00 p.m."),
          SizedBox(
            height: 14,
          ),
          StreamItem(
              title: "Burnley vs Swansea City",
              subtitle: "Sky Sport C1/HD UK| BBC Radio\n5 Live| Sky Go UK",
              alarm: "Sat 13 Aug 03:00 p.m."),
          SizedBox(
            height: 14,
          ),
          StreamItem(
              title: "Everton vs Tottenham",
              subtitle: "Sky Sport C1/HD UK| BBC Radio\n6 Live| Sky Go UK",
              alarm: "Fri 13 Aug 03:00 p.m."),
          SizedBox(
            height: 14,
          ),
          StreamItem(
              title: "Southampton vs Watford",
              subtitle: "Sky Sport C1/HD UK| BBC Radio\n7 Live| Sky Go UK",
              alarm: "Wed 13 Aug 03:00 p.m."),
          SizedBox(
            height: 14,
          ),
          StreamItem(
              title: "Southampton vs Watford",
              subtitle: "Sky Sport C1/HD UK| BBC Radio\n8 Live| Sky Go UK",
              alarm: "Fri 13 Aug 03:00 p.m."),
          SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
