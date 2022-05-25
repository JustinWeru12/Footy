import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/api/crud.dart';
import 'package:football/pages/home/home_screen.dart';
import 'package:football/services/navigator.dart';
import 'package:football/services/service_locator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const route = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget _showLogo(Size size) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          height: size.width * 0.4,
          width: size.width * 0.4,
          // decoration: BoxDecoration(
          //   color: Colors.white.withOpacity(0.1),
          //   borderRadius: BorderRadius.circular(50)
          // ),
          child: Hero(
            tag: 'hero',
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: Image.asset(
                'assets/icons/icon.png',
                // width: 50,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ));
  }

  Widget _buildGoogleLoginButton() {
    return Container(
        height: 48.0,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          label: Text(
            "Continue With Google",
            style: Theme.of(context).textTheme.button,
          ),
          icon: SvgPicture.asset(
            "assets/icons/google.svg",
            height: 30,
            width: 30,
          ),
          onPressed: () {
            app<FootballNavigator>().pushReplacementNamed(
              HomeScreen.route,
              type: RouteType.fade,
            );
          },
        ));
  }

  Widget _buildEmailLoginButton() {
    return Container(
      height: 48.0,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        label: Text(
          "Continue With Email",
          style: Theme.of(context).textTheme.button,
        ),
        icon: SvgPicture.asset(
          "assets/icons/email.svg",
          height: 30,
          width: 30,
        ),
        onPressed: () {
          app<FootballNavigator>().pushReplacementNamed(
            HomeScreen.route,
            type: RouteType.fade,
          );
        },
      ),
    );
  }

  Widget _buildFacebookLoginButton() {
    return Container(
      height: 48.0,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        label: Text(
          "Continue With Facebook",
          style: Theme.of(context).textTheme.button,
        ),
        icon: SvgPicture.asset(
          "assets/icons/facebook.svg",
          height: 30,
          width: 30,
        ),
        onPressed: () {
          app<FootballNavigator>().pushReplacementNamed(
            HomeScreen.route,
            type: RouteType.fade,
          );
        },
      ),
    );
  }

  Widget _buildLoginScreen(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        _showLogo(MediaQuery.of(context).size),
        const Spacer(flex: 3),
        _buildGoogleLoginButton(),
        const SizedBox(height: 10),
        _buildEmailLoginButton(),
        const SizedBox(height: 10),
        _buildFacebookLoginButton(),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _buildLoginScreen(theme);
  }
}
