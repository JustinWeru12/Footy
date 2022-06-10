import 'package:flutter/material.dart';
import 'package:football/services/theme/footy_background.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rive/rive.dart';

/// The initial screen that is shown when opening the app.
///
/// After initialization, the [ApplicationCubit] will navigate to either the
/// [LoginScreen] or the [HomeScreen].
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.clearsplash}) : super(key: key);
  final VoidCallback clearsplash;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      widget.clearsplash();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // start initializing localized date format
    initializeDateFormatting(Localizations.localeOf(context).toString());

    return FootballBackground(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.3,
              child: const Center(
                child: RiveAnimation.asset(
                  'assets/rive/animated_icon.riv',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: const RiveAnimation.asset(
                'assets/rive/animation.riv',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
