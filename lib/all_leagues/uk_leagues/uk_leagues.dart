import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/all_leagues/uk_leagues/eng_champ.dart';
import 'package:football/all_leagues/uk_leagues/eng_facup.dart';
import 'package:football/all_leagues/uk_leagues/eng_league.dart';
import 'package:football/all_leagues/uk_leagues/ire_prem.dart';
import 'package:football/drawer/drawer.dart';

class UKLeagues extends StatefulWidget {
  const UKLeagues({Key? key}) : super(key: key);

  @override
  State<UKLeagues> createState() => _UKLeaguesState();
}

class _UKLeaguesState extends State<UKLeagues>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final topTabs = <Tab>[
    const Tab(text: "English Premier League"),
    const Tab(text: "English FA Cup"),
    const Tab(text: "English Championship"),
    const Tab(text: "Ireland Premier League"),
  ];
  @override
  void initState() {
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  width: 20,
                  height: 20,
                  color: Theme.of(context).iconTheme.color,
                  fit: BoxFit.contain,
                  semanticsLabel: 'Menu',
                ),
                onPressed: () => Scaffold.of(context).openDrawer()),
          ),
          actions: [
            PopupMenuButton(
                color: Colors.black,
                itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text(
                          "Email Dev",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 1,
                      ),
                      const PopupMenuItem(
                        child: Text(
                          "Rate App",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 2,
                      ),
                    ]),
          ],
          title: const Text("Live Football on TV"),
          backgroundColor: const Color(0xFF075e54),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/blue.jfif'),
                    fit: BoxFit.fill)),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            controller: _tabController,
            tabs: topTabs,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF4F148B), Color(0xFF880E4F)])),
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: const [EnglishPremier(), FACup(), EULeague(), IRECup()],
          ),
        ),
        drawer: Drawer(child: Drrawer().drawer(context)));
  }
}
