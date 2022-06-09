import 'package:flutter/material.dart';
import 'package:football/api/crud.dart';
import 'package:football/pages/home/home_tab_view.dart';
import 'package:football/pages/home/models/home_tab_model.dart';
import 'package:football/services/scroll_direction_listener.dart';
import 'package:football/services/user_auth/authentication.dart';
import 'package:football/services/user_auth/user.dart';
import 'package:football/widgets/footy_scaffold.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key, this.auth, required this.logoutCallback, this.userId})
      : super(key: key);

  static const route = 'home';
  final BaseAuth? auth;
  final VoidCallback logoutCallback;
  final String? userId;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CrudMethods crudObj = CrudMethods();
  UserData? userData;
  @override
  void initState() {
    widget.auth!.getCurrentUser().then((user) => {
          setState(() {
            crudObj.getDataFromUserFromDocument().then((value) {
              Map<String, dynamic> dataMap = value.data();
              if (mounted) {
                setState(() {
                  userData = UserData(
                    userId: user!.uid,
                    fullNames: dataMap['fullNames'],
                    picture: dataMap['picture'],
                    email: dataMap['email'],
                    notify: dataMap['notify'],
                    liveOnly: dataMap['liveOnly'],
                  );
                });
              }
            });
          }),
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeTabModel()),
      ],
      child: ScrollDirectionListener(
        depth: 1,
        child: FootballScaffold(
          body: HomeTabView(
            auth: widget.auth,
            logoutCallback: widget.logoutCallback,
            userData: userData!,
          ),
        ),
      ),
    );
  }
}
