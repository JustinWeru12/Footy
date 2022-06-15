import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:football/pages/login/rootpage.dart';
import 'package:football/services/footy_message.dart';
import 'package:football/services/navigator.dart';
import 'package:football/services/scroll_behavior.dart';
import 'package:football/services/theme/bloc/theme_bloc.dart';
import 'package:football/services/service_locator.dart';
import 'package:football/services/theme/footy_theme_provider.dart';
import 'package:football/pages/splash/splash_screen.dart';
import 'package:football/services/user_auth/authentication.dart';
import 'package:provider/provider.dart';

const isFree = String.fromEnvironment('flavor', defaultValue: 'free') == 'free';
const isPro = String.fromEnvironment('flavor') == 'pro';

/// Builds the root [MaterialApp].
class FootballApp extends StatefulWidget {
  const FootballApp({Key? key}) : super(key: key);

  @override
  State<FootballApp> createState() => _FootballAppState();
}

class _FootballAppState extends State<FootballApp> {
  bool splash = true;

  void clearSplash() {
    setState(() {
      splash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    final systemBrightness = context.watch<Brightness>();
    return MaterialApp(
      title: 'Live Football On TV',
      debugShowCheckedModeBanner: false,
      theme: themeBloc.state.lightFootballTheme.themeData,
      darkTheme: themeBloc.state.darkFootballTheme.themeData,
      themeMode: systemBrightness == Brightness.light
          ? ThemeMode.light
          : ThemeMode.dark,
      color: Colors.black,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: kMaterialSupportedLanguages.map(Locale.new),
      navigatorKey: app<FootballNavigator>().key,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: [
        footballRouteObserver,
      ],
      home: splash
          ? SplashScreen(
              clearsplash: clearSplash,
            )
          : RootPage(auth: Auth()),
      builder: (_, child) => _ContentBuilder(child: child),
    );
  }
}

class _ContentBuilder extends StatelessWidget {
  const _ContentBuilder({
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FootballThemeProvider(
      child: ScrollConfiguration(
        behavior: const FootballScrollBehavior(),
        child: FootballMessage(
          child: child,
        ),
      ),
    );
  }
}
