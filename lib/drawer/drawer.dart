import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/about/about.dart';
import 'package:football/all_leagues/uk_leagues/uk_leagues.dart';
import 'package:football/home/landingpage.dart';
import 'package:football/news/leage_tables_tabbar.dart';
import 'package:football/news/select_team.dart';
import 'package:football/settings/settings.dart';
import 'package:football/widgets/widgets.dart';

class Drrawer {
  Widget drawer(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1.38,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF4F148B), Color(0xFF880E4F)])),
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/blue.jfif'),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  const LandingPage())),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/user1.png'),
                              fit: BoxFit.fill),
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Live Football on TV",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Your Gide to Live Football",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 25,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ExpansionTile(
              initiallyExpanded: false,
              tilePadding: const EdgeInsets.only(right: -4),
              childrenPadding: const EdgeInsets.only(left: 30),
              trailing: const SizedBox.shrink(),
              title: const Leagues(
                icon: "assets/icons/football.svg",
                title: "All Leagues",
                secondaryIcon: Icons.expand_more_outlined,
                color: Colors.grey,
              ),
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const UKLeagues())),
                  child: const Leagues(
                    icon: "assets/icons/football.svg",
                    title: "Daily Listings",
                    secondaryIcon: null,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const UKLeagues())),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const UKLeagues())),
                    child: const Leagues(
                        icon: "assets/icons/football.svg",
                        title: "UK & Irish Leagues",
                        secondaryIcon: null,
                        color: Colors.yellow),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const UKLeagues())),
                  child: const Leagues(
                    icon: "assets/icons/football.svg",
                    title: "European Leagues",
                    secondaryIcon: null,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const UKLeagues())),
                  child: const Leagues(
                      icon: "assets/icons/football.svg",
                      title: "Asian Leagues",
                      secondaryIcon: null,
                      color: Colors.green),
                ),
              ],
            ),
            ExpansionTile(
              initiallyExpanded: false,
              tilePadding: const EdgeInsets.only(right: -4),
              childrenPadding: const EdgeInsets.only(left: 30),
              trailing: const SizedBox.shrink(),
              title: const Leagues(
                  icon: "assets/icons/trophy.svg",
                  title: "My Leagues",
                  secondaryIcon: Icons.expand_more_outlined,
                  color: Colors.grey),
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const UKLeagues())),
                  child: const Leagues(
                      icon: "assets/icons/trophy.svg",
                      title: "Daily Listings",
                      secondaryIcon: null,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const UKLeagues())),
                  child: const Leagues(
                      icon: "assets/icons/trophy.svg",
                      title: "UK & Irish Leagues",
                      secondaryIcon: null,
                      color: Colors.yellow),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const UKLeagues())),
                  child: const Leagues(
                      icon: "assets/icons/trophy.svg",
                      title: "European Leagues",
                      secondaryIcon: null,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const UKLeagues())),
                  child: const Leagues(
                      icon: "assets/icons/trophy.svg",
                      title: "Asian Leagues",
                      secondaryIcon: null,
                      color: Colors.green),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectTeam()),
                );
              },
              child: const Leagues(
                  icon: "assets/icons/news.svg",
                  title: "News",
                  secondaryIcon: null,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                null;
              },
              child: const Leagues(
                  icon: "assets/icons/ranking.svg",
                  title: "League Tables",
                  secondaryIcon: null,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Leagues(
                  icon: "assets/icons/stats.svg",
                  title: "Statistics",
                  secondaryIcon: null,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              child: const Leagues(
                  icon: "assets/icons/settings.svg",
                  title: "Settings",
                  secondaryIcon: null,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              child: const Leagues(
                  icon: "assets/icons/about.svg",
                  title: "About",
                  secondaryIcon: null,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 25,
            ),
            const Leagues(
                icon: "assets/icons/pro.svg",
                title: "Go Pro / Remove Ads",
                secondaryIcon: null,
                color: Colors.grey),
            const Spacer(),
            const Text(
              "V 1.0.0",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
