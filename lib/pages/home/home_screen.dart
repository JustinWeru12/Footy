import 'package:flutter/material.dart';
import 'package:football/pages/home/home_tab_view.dart';
import 'package:football/pages/home/models/home_tab_model.dart';
import 'package:football/services/scroll_direction_listener.dart';
import 'package:football/widgets/harpy_scaffold.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeTabModel()),
      ],
      child: const ScrollDirectionListener(
        depth: 1,
        child: FootballScaffold(
          body: HomeTabView(),
        ),
      ),
    );
  }
}
