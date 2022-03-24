import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/drawer/drawer.dart';
import 'package:football/home/screen3.dart';
import 'package:football/home/screen4.dart';
import 'package:football/home/screen5.dart';
import 'package:football/home/screen7.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final topTabs = <Tab>[
    const Tab(text: "Football Today"),
    const Tab(text: "Football Tommorow"),
    const Tab(text: "Football in 2+ Days"),
    const Tab(text: "Football in 3+ Days"),
    const Tab(text: "Football in 4+ Days"),
    const Tab(text: "Football in 5+ Days"),
    const Tab(text: "Football in 6+ Days"),
  ];
  @override
  void initState() {
    _tabController = TabController(length: 7, initialIndex: 0, vsync: this);
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
                color: Theme.of(context).canvasColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
            children: const [
              Screen3(),
              Screen4(),
              Screen5(),
              Screen3(),
              Screen7(),
              Screen3(),
              Screen4(),
            ],
          ),
        ),
        drawer: Drawer(child: Drrawer().drawer(context)));
  }
}
