import 'package:flutter/material.dart';

class United extends StatefulWidget {
  const United({Key? key}) : super(key: key);

  @override
  State<United> createState() => _UnitedState();
}

class _UnitedState extends State<United> {
  List teext = [
    "Arsenal",
    "AFC\nBournemouth",
    "Burnley",
    "Chelsea",
    "Crystal Palace",
    "Everton",
    "Hull City",
    "Leicester City",
    "Liverpool",
    "Manchester",
    "Manchester\nUnited",
    "Middlessbrough",
  ];

  List imagges = [
    const AssetImage("assets/images/shirt1.png"),
    const AssetImage("assets/images/shirt2.png"),
    const AssetImage("assets/images/shirt3.png"),
    const AssetImage("assets/images/shirt3.png"),
    const AssetImage("assets/images/shirt2.png"),
    const AssetImage("assets/images/shirt1.png"),
    const AssetImage("assets/images/shirt2.png"),
    const AssetImage("assets/images/shirt1.png"),
    const AssetImage("assets/images/shirt3.png"),
    const AssetImage("assets/images/shirt1.png"),
    const AssetImage("assets/images/shirt2.png"),
    const AssetImage("assets/images/shirt3.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff2a2a2a),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: teext.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imagges[index], fit: BoxFit.fill),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    teext[index],
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              ));
            }),
      ),
    );
  }
}
