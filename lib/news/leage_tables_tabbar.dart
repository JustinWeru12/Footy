import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/all_leagues/nested_tabs/bookstoptabs.dart';
import 'package:football/all_leagues/nested_tabs/gamestoptabs.dart';
import 'package:football/all_leagues/nested_tabs/hometoptabs.dart';
import 'package:football/all_leagues/nested_tabs/moviestoptabs.dart';
import 'package:football/all_leagues/nested_tabs/musictoptabs.dart';
import 'package:football/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // final Widget child;
  //HomePage({Key key, this.child}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

Color primaryColor = const Color(0xff109618);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
              padding: const EdgeInsets.all(5),
              isScrollable: true,
              indicatorColor: Colors.blue,
              indicatorWeight: 4.0,
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (index) {
                setState(() {
                  switch (index) {
                    case 0:
                      primaryColor = const Color(0xffff5722);
                      break;
                    case 1:
                      primaryColor = const Color(0xff3f51b5);
                      break;
                    case 2:
                      primaryColor = const Color(0xffe91e63);
                      break;
                    case 3:
                      primaryColor = const Color(0xff9c27b0);
                      break;
                    case 4:
                      primaryColor = const Color(0xff2196f3);
                      break;
                    default:
                  }
                });
              },
              tabs: <Widget>[
                Tab(
                  icon: Image.asset(
                    'assets/images/manu.png',
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  child: const Text(
                    'PREMIER LEAGUE',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/images/logo.jpg',
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  child: const Text(
                    'CHAMPIONSHIP',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/images/logo3.jfif',
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  child: const Text(
                    'LAZARA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/images/logo2.png',
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  child: const Text(
                    'CHELSEA',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    'assets/images/logo3.jfif',
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  child: const Text(
                    'UNITED',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              HomeTopTabs(0xFFE5E5E5), //ff5722
              GamesTopTabs(0xFFE5E5E5), //3f51b5
              MoviesTopTabs(0xFFE5E5E5), //e91e63
              BooksTopTabs(0xFFE5E5E5), //9c27b0
              MusicTopTabs(0xFFE5E5E5), //2196f3 //4CAF50
            ],
          ),
          drawer: Drawer(child: Drrawer().drawer(context))),
    );
  }
}
