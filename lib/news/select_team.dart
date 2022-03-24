import 'package:flutter/material.dart';
import 'package:football/news/Lazara.dart';
import 'package:football/news/championship.dart';
import 'package:football/news/chelsea.dart';
import 'package:football/news/premier_league.dart';
import 'package:football/news/united.dart';

class SelectTeam extends StatefulWidget {
  const SelectTeam({Key? key}) : super(key: key);

  @override
  State<SelectTeam> createState() => _SelectTeamState();
}

class _SelectTeamState extends State<SelectTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff111111),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_outlined,
            ),
          ),
          title: const Text("Select Team"),
        ),
        body: DefaultTabController(
            length: 5,
            child: Column(
              children: <Widget>[
                Material(
                    child: Container(
                  color: const Color(0xff2a2a2a),
                  child: TabBar(
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(width: 10.0, color: Colors.blue),
                    ),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/manu.png'),
                                    fit: BoxFit.fill),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("PREMIER LEAGUE")
                          ],
                        ),
                      ),
                      Tab(
                        height: 90,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/logo2.png'),
                                    fit: BoxFit.fill),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("CHAMPIONSHIP")
                          ],
                        ),
                      ),
                      Tab(
                        height: 90,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/logo3.jfif'),
                                    fit: BoxFit.fill),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Lazara")
                          ],
                        ),
                      ),
                      Tab(
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/manu.png'),
                                    fit: BoxFit.fill),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("CHELSEA")
                          ],
                        ),
                      ),
                      Tab(
                        height: 90,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/logo2.png'),
                                    fit: BoxFit.fill),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("UNITED")
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                const Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      PremierLeague(),
                      Championship(),
                      Lazara(),
                      Chelsea(),
                      United(),
                    ],
                  ),
                )
              ],
            )) // This trailing comma makes
        );
  }
}
