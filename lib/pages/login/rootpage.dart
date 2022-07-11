import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:football/api/crud.dart';
import 'package:football/pages/home/home_screen.dart';
import 'package:football/pages/login/login_screen.dart';
import 'package:football/services/user_auth/authentication.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus {
  notDetermined,
  notLoggedIn,
  loggedIn,
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key, this.auth}) : super(key: key);

  final BaseAuth? auth;

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with WidgetsBindingObserver {
  AuthStatus authStatus = AuthStatus.notDetermined;
  String _userId = "";
  CrudMethods crudObj = CrudMethods();
  int? check = 0;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addObserver(this);
    getDone();
    widget.auth!.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user.uid;
          crudObj.createOrUpdateUserData({"online": true});
        }
        authStatus =
            user?.uid == null ? AuthStatus.notLoggedIn : AuthStatus.loggedIn;
      });
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_userId != "") {
      if (state == AppLifecycleState.resumed) {
        crudObj.createOrUpdateUserData({"online": true});
      } else {
        crudObj.createOrUpdateUserData(
            {"online": false, "lastseen": DateTime.now()});
      }
    }
  }

  getDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      check = prefs.getInt('counter');
    });
  }

  void loginCallback() {
    widget.auth!.getCurrentUser().then((user) {
      if (mounted) {
        setState(() {
          _userId = user!.uid.toString();
          authStatus = AuthStatus.loggedIn;
        });
      }
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  void logoutCallback() {
    widget.auth!.signOut().then((value) => setState(() {
          authStatus = AuthStatus.notLoggedIn;
          _userId = "";
        }));
    widget.auth!.signOutGoogle().then((value) => setState(() {
          authStatus = AuthStatus.notLoggedIn;
          _userId = "";
        }));
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset('assets/icons/icon.png', fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return buildWaitingScreen();
      case AuthStatus.notLoggedIn:
        return LoginScreen(
          auth: widget.auth,
          loginCallback: loginCallback,
          logoutCallback: logoutCallback,
          title: "Atlatik",
        );
      case AuthStatus.loggedIn:
        if (_userId.isNotEmpty) {
          return HomeScreen(
            userId: _userId,
            auth: widget.auth,
            logoutCallback: logoutCallback,
          );
        } else {
          return buildWaitingScreen();
        }
      default:
        return buildWaitingScreen();
    }
  }
}
