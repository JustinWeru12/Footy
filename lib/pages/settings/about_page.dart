import 'package:flutter/material.dart';
import 'package:football/models/helper.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/widgets/footy_scaffold.dart';

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

  Widget header() {
    return Column(
      children: [
        Text(
          "Live Football On TV",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        smallVerticalSpacer,
        Text(
          "V 1.0.0",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        verticalSpacer,
        Text(
          "You are a LITE user",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        smallVerticalSpacer,
        Text(
          "You can upgrade to the PRO version at any time to enjoy all the features.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        verticalSpacer,
        Text(
          "Please Note: The use of each of the European categories, and their governing bodies trademarks and logos, are registered trademarks of the respective owners, the use in this app is for reference only and does not imply any connection or relationship.",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        smallVerticalSpacer,
      ],
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Visual Design.",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          smallVerticalSpacer,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          "assets/icons/facebook.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          "assets/icons/insta.png",
                          height: 30,
                          width: 20,
                        ),
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          "assets/icons/twitter.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      onPressed: () {}),
                ]),
          ),
          smallVerticalSpacer,
          smallVerticalSpacer,
          Text(
            "https://www.visualdesign.ie",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          smallVerticalSpacer,
          smallVerticalSpacer,
          Text(
            "Privacy Policy",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          smallVerticalSpacer,
          Text(
            "https://www.visualdesign.ie/privacy-policy-app/",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          verticalSpacer,
          verticalSpacer,
          Text(
            "Crafted in Ireland.",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          verticalSpacer,
          Text(
            "©2011-2022 Visual Design",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
