import 'package:flutter/material.dart';
import 'package:football/all_leagues/nested_tabs/homeforyoutabs.dart';
import 'package:football/all_leagues/nested_tabs/homefour.dart';
import 'package:football/all_leagues/nested_tabs/homethree.dart';
import 'package:football/all_leagues/nested_tabs/hometopchartstabs.dart';
import 'package:football/constants.dart';
import 'package:football/drawer/drawer.dart';

// ignore: must_be_immutable
class MusicTopTabs extends StatefulWidget {
  int colorVal;
  MusicTopTabs(this.colorVal, {Key? key}) : super(key: key);
  @override
  _MusicTopTabsState createState() => _MusicTopTabsState();
}

class _MusicTopTabsState extends State<MusicTopTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xff2196f3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: Drawer(child: Drrawer().drawer(context)),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor: const Color(0xff2196f3),
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Text('Top Scores',
                    style: TextStyle(
                        color: _tabController.index == 0
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                child: Text('Top Assists',
                    style: TextStyle(
                        color: _tabController.index == 1
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                child: Text('Top Red Cards',
                    style: TextStyle(
                        color: _tabController.index == 2
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                child: Text('Top Yellow Cards',
                    style: TextStyle(
                        color: _tabController.index == 3
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            HomeForYouTabs(),
            HomeTopChartsTabs(),
            HomeThree(),
            Homefour(),
          ],
        ),
      ),
    );
  }
}
