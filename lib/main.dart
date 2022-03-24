import 'package:flutter/material.dart';
import 'package:football/constants.dart';
import 'package:football/home/landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeData> _notifier = ValueNotifier(FootyTheme().harpy);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
        valueListenable: _notifier,
        builder: (_, theme, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Football',
            theme: theme.copyWith(
              shadowColor: Colors.grey[400],
              textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: 'Montserrat',
                  bodyColor:
                      theme == FootyTheme().swan ? Colors.black : Colors.white),
              iconTheme: Theme.of(context).iconTheme.copyWith(
                  color:
                      theme == FootyTheme().swan ? Colors.black : Colors.white),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const LandingPage(),
          );
        });
  }
}
