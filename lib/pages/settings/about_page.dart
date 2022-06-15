import 'package:flutter/material.dart';
import 'package:football/models/helper.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/widgets/footy_scaffold.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return FootballScaffold(
      title: "About",
      body: SingleChildScrollView(
          child: Column(
              children: [_showLogo(), header(), const Divider(), body()])),
    );
  }

  Widget _showLogo() {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          height: Helper.setWidth(context, factor: 0.4),
          width: Helper.setWidth(context, factor: 0.4),
          child: const Center(
            child: RiveAnimation.asset(
              'assets/rive/animated_icon.riv',
              fit: BoxFit.contain,
            ),
          ),
        ));
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Column(
        children: [
          Text(
            "Live Football On TV",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontFamily: "Comfortaa", fontWeight: FontWeight.w600),
          ),
          smallVerticalSpacer,
          Text(
            "v1.0.0",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontFamily: "Comfortaa", fontWeight: FontWeight.w600),
          ),
          verticalSpacer,
          Text(
            "Thank you for downloading the Lite (free) version of the app.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontFamily: "Comfortaa", fontWeight: FontWeight.w500),
          ),
          smallVerticalSpacer,
          Text(
            "You can upgrade to the PRO version at any time to enjoy all the features.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontFamily: "Comfortaa"),
          ),
          verticalSpacer,
          Text(
            "Please Note: The use of each of the European categories, and their governing bodies trademarks and logos, are registered trademarks of the respective owners, the use in this app is for reference only and does not imply any connection or relationship.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontFamily: "Comfortaa"),
          ),
          smallVerticalSpacer,
        ],
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [          
          TextButton.icon(
            onPressed: () {
              _launchInBrowser(
                  Uri.parse("https://twitter.com/LiveFootball_ie"));
            },
            icon: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                "assets/icons/twitter.png",
                height: 30,
                width: 30,
              ),
            ),
            label: Text(
              "@LiveFootball_ie",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: "Comfortaa"),
            ),
          ),
          TextButton(
            child: Text(
              "www.livefootball.ie",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontFamily: "Comfortaa",
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline),
            ),
            onPressed: () {
              _launchInBrowser(Uri.parse("https://www.livefootball.ie/"));
            },
          ),
          TextButton(
            child: Text(
              "Privacy Policy",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontFamily: "Comfortaa",
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline),
            ),
            onPressed: () {
              _launchInBrowser(
                  Uri.parse("https://www.livefootball.ie/privacy-policy-app/"));
            },
          ),
          verticalSpacer,
          Text(
            "Crafted in Ireland.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontFamily: "Comfortaa", fontWeight: FontWeight.w600),
          ),
          verticalSpacer,
          Text(
            "©2011-2022 Visual Design",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontFamily: "Comfortaa"),
          ),
        ],
      ),
    );
  }
}
