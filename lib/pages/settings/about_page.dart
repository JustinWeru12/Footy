import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:football/models/helper.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/widgets/footy_list_card.dart';
import 'package:football/widgets/footy_list_tile.dart';
import 'package:football/widgets/footy_scaffold.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> mailto() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@livefootball.ie',
      query: encodeQueryParameters(
          <String, String>{'subject': 'Live Football on TV App'}),
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could send email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FootballScaffold(
      title: "About",
      actions: [
        PopupMenuButton(
          onSelected: (_) => showLicensePage(context: context),
          itemBuilder: (_) => [
            const PopupMenuItem(
              value: true,
              child: Text('licenses'),
            ),
          ],
        ),
      ],
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          _showLogo(),
          verticalSpacer,
          header(),
          verticalSpacer,
          disclaimer(),
          verticalSpacer,
          pro(),
          verticalSpacer,
          credits(),
          verticalSpacer,
          privacy(),
          verticalSpacer,
        ]),
      )),
    );
  }

  Widget _showLogo() {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: Helper.setWidth(context, factor: 0.4),
              width: Helper.setWidth(context, factor: 0.4),
              child: const Center(
                child: RiveAnimation.asset(
                  'assets/rive/animated_icon.riv',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            smallVerticalSpacer,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.7,
              child: const RiveAnimation.asset(
                'assets/rive/animation.riv',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ));
  }

  Widget header() {
    return Card(
      child: Column(
        children: [
          FootballListTile(
            leading: const Icon(Icons.history),
            title: Text(
              'version 1.0.0',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          FootballListTile(
            leading: const Icon(FeatherIcons.twitter),
            title: const Text('Live Football App on Twitter'),
            subtitle: Text('@LiveFootball_ie',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
            onTap: () {
              _launchInBrowser(
                  Uri.parse("https://twitter.com/LiveFootball_ie"));
            },
          ),
          FootballListTile(
            leading: const Icon(FeatherIcons.globe),
            title: Text('www.livefootball.ie',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
            onTap: () {
              _launchInBrowser(Uri.parse("https://www.livefootball.ie/"));
            },
          ),
        ],
      ),
    );
  }

  Widget disclaimer() {
    return Card(
      child: Column(
        children: [
          smallVerticalSpacer,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Please Note: The use of each of the European categories, and their governing bodies trademarks and logos, are registered trademarks of the respective owners, the use in this app is for reference only and does not imply any connection or relationship.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: "Comfortaa"),
            ),
          ),
          smallVerticalSpacer,
        ],
      ),
    );
  }

  Widget pro() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            smallVerticalSpacer,
            Text(
              "Thank you for downloading the Lite (free) version of the app.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: "Comfortaa", fontWeight: FontWeight.w500),
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
            smallVerticalSpacer,
            FootballListTile(
              leading: Icon(
                FeatherIcons.star,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text("Live Football pro",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  )),
              onTap: () {},
            ),
            smallVerticalSpacer,
          ],
        ),
      ),
    );
  }

  Widget credits() {
    final theme = Theme.of(context);

    final style = TextStyle(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    return FootballListCard(
      leading: const Icon(FeatherIcons.mail),
      multilineTitle: true,
      title: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: 'Crafted in Ireland by '),
            TextSpan(text: 'Visual Design\n', style: style),
            TextSpan(text: 'support@livefootball.ie', style: style),
          ],
        ),
      ),
      subtitle: const Text('Your feedback will be appreciated!'),
      onTap: mailto,
    );
  }

  Widget privacy() {
    return FootballListCard(
        leading: const Icon(CupertinoIcons.exclamationmark_shield),
        title: const Text('Privacy policy'),
        onTap: () => _launchInBrowser(
            Uri.parse("https://www.livefootball.ie/privacy-policy-app/")));
  }
}
