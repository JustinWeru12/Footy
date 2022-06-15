import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/widgets/footy_list_card.dart';
import 'package:football/widgets/footy_scaffold.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool islive = false, enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    return FootballScaffold(
      title: "Settings",
      body: Column(children: [
        FootballListCard(
            leading: const Icon(FeatherIcons.heart),
            title: const Text(
              'Favorite Leagues',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Select your favorite leagues to display your leagues menu',
            ),
            onTap: () {}),
        verticalSpacer,
        FootballListCard(
            leading: const Icon(FeatherIcons.filter),
            title: const Text(
              'Broadcast Filters',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Select channels to remove from your suggestion list',
            ),
            onTap: () {}),
        verticalSpacer,
        FootballListCard(
            leading: const Icon(FeatherIcons.list),
            title: const Text(
              'Live Games Only',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Only show games that broadcast live for your region',
            ),
            trailing: CupertinoSwitch(
                value: islive,
                onChanged: (val) {
                  setState(() {
                    islive = val;
                  });
                }),
            onTap: () {}),
        verticalSpacer,
        FootballListCard(
            leading: const Icon(CupertinoIcons.news),
            title: const Text(
              'News Settings',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Configure the settings and teams for your news feed',
            ),
            onTap: () {}),
        verticalSpacer,
        FootballListCard(
            leading: const Icon(FeatherIcons.tv),
            title: const Text(
              'Preferred Region for TV Broadcasts',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Show TV channels from your region. Displays region specific TV stations and NOT daily listings',
            ),
            onTap: () {}),
        verticalSpacer,
        FootballListCard(
            leading: const Icon(CupertinoIcons.bell),
            title: const Text(
              'Enable Push Notifications',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              'Get notifications and alerts',
            ),
            trailing: CupertinoSwitch(
                value: enableNotifications,
                onChanged: (val) {
                  setState(() {
                    enableNotifications = val;
                  });
                }),
            onTap: () {}),
        verticalSpacer,
      ]),
    );
  }
}
