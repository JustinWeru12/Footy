import 'package:flutter/material.dart';
import 'package:football/all_leagues/nested_tabs/homeforyoutabs.dart';
import 'package:football/all_leagues/nested_tabs/homefour.dart';
import 'package:football/all_leagues/nested_tabs/homethree.dart';
import 'package:football/all_leagues/nested_tabs/hometopchartstabs.dart';
import 'package:football/constants.dart';
import 'package:football/drawer/drawer.dart';

// ignore: must_be_immutable
class BooksTopTabs extends StatefulWidget {
  int colorVal;
  BooksTopTabs(this.colorVal, {Key? key}) : super(key: key);
  @override
  _BooksTopTabsState createState() => _BooksTopTabsState();
}

class _BooksTopTabsState extends State<BooksTopTabs>
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
      widget.colorVal = 0xFFE5E5E5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor: Colors.white,
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
        drawer: Drawer(child: Drrawer().drawer(context)),
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
