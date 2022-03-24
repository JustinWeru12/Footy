import 'package:flutter/material.dart';
import 'package:football/home/landingpage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 1, 26, 51)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                  height: 180,
                  width: 150,
                  child: Image(image: AssetImage("assets/images/player.png"))),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()));
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => screen2()));
                },
                child: CircularPercentIndicator(
                  animation: true,
                  animationDuration: 2500,
                  header: const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "LIVE FOOTBALL ON TV",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  radius: 100.0,
                  lineWidth: 10.0,
                  percent: 1,
                  center: const Text(
                    "100%",
                    style: TextStyle(color: Colors.white),
                  ),
                  progressColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
