import 'package:flutter/material.dart';
import 'package:football/widgets/widgets.dart';

class Screen5 extends StatefulWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(
            height: 6,
          ),
          StreamItem(
              title: "Southampton vs Watford",
              subtitle: "No TV channels listed for your region",
              alarm: "Sat 13 Aug 03:00 p.m."),
          SizedBox(
            height: 10,
          ),
          StreamItem(
              title: "Manchester City vs Sunderland",
              subtitle: "BT Sport 1 | BT sport live Streaming",
              alarm: "Sat 13 Aug 05:30 p.m."),
          SizedBox(
            height: 20,
          ),
          Suggestions()
        ],
      ),
    );
  }
}
