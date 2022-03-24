import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StreamItem extends StatelessWidget {
  const StreamItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.alarm})
      : super(key: key);

  final String title, subtitle, alarm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 50),
              padding: const EdgeInsets.fromLTRB(25, 4, 4, 8),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).shadowColor,
                        offset: const Offset(2, 2),
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        alarm,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      PopupMenuButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.alarm_outlined,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Reminder",
                                        style: TextStyle(),
                                      ),
                                    ],
                                  ),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.calendar_view_month_outlined,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Calender",
                                        style: TextStyle(),
                                      ),
                                    ],
                                  ),
                                  value: 2,
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.share_outlined,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Share",
                                        style: TextStyle(),
                                      ),
                                    ],
                                  ),
                                  value: 3,
                                ),
                              ]),
                    ],
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(-1, 1),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/manu.png'),
                      fit: BoxFit.fill),
                  // color: Theme.of(context).canvasColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Leagues extends StatelessWidget {
  final IconData? secondaryIcon;
  final String title, icon;
  final Color color;

  const Leagues(
      {Key? key,
      required this.secondaryIcon,
      required this.icon,
      required this.title,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 25,
                height: 25,
                color: color,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              )
            ],
          ),
          Icon(
            secondaryIcon,
          ),
        ],
      ),
    );
  }
}

class Suggestions extends StatelessWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15)),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "International - Olympic Soccer - Men",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "International - Club Friendly",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "International - International Champion Cup",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "France - Ligue 1",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Portugal - Premia Laga",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "England Champion Ship",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "International - CAF Confedration",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "International - Olympic Soccer - Men",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;

  const Settings(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(237, 158, 158, 158),
            size: 40,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 19, color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
