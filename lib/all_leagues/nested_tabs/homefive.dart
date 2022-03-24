import 'package:flutter/material.dart';
import 'package:football/constants.dart';

class Homefive extends StatefulWidget {
  const Homefive({Key? key}) : super(key: key);

  //final Widget child;

  //HomeForYouTabs({ required Key key,required this.child}) : super(key: key);

  @override
  _HomefiveState createState() => _HomefiveState();
}

class _HomefiveState extends State<Homefive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const <Widget>[
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
            title: Text(
              'Glaberial Jesus',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Palmeries',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '10',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
            title: Text(
              'Diego Souza',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Palmeries',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '10',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
            title: Text(
              'Grafite ',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Santa Cruz',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '8',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
            title: Text(
              'Vitor',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Santos Fc',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '8',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
