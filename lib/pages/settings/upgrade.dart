import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:football/models/helper.dart';
import 'package:football/services/theme/footy_theme.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({Key? key}) : super(key: key);

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  double _value = 46.99;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: FootballScaffold(
            title: "Upgrade",
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: kBorderRadius,
                      child: FootballListCard(
                          contentPadding: EdgeInsets.zero,
                          title: Column(
                            children: [
                              tabBar(),
                              const Divider(
                                height: 2,
                                thickness: 2,
                              ),
                              tabView(context),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )));
  }

  Widget tabBar() {
    return const FootballTabBar(
      padding: EdgeInsets.all(8.0),
      tabs: [
        FootballTab(
          icon: Icon(FeatherIcons.feather),
          text: Text("Pro+"),
        ),
        FootballTab(
          icon: Icon(FeatherIcons.star),
          text: Text("Pro"),
        ),
      ],
    );
  }

  Widget tabView(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 670),
      child: TabBarView(
        children: [ Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              itemLabel(context, "Pro+ includes all Pro tier features"),
              itemLabel(context,
                  "Pro+ bundle also includes support and any future additions to the app, for life."),
              itemLabel(context,
                  "It is your way of supporting the longevity of the app development and its platform."),
              buttonProPlus(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                    "*Please note that you can cancel your subscription at any time before the next billing cycle.",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        fontFamily: "Comfortaa")),
              ),
              divider(),
              proPlusLifetime()
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              itemLabel(context, "Ads Free."),
              itemLabel(context,
                  "Settings/Preferences to configure what leagues you want to be shown."),
              itemLabel(context, "50+ Leagues worldwide (and growing)."),
              itemLabel(
                  context, "League filter to search for the preferred league."),
              itemLabel(context,
                  "Extra match info for venue, season, match-week, historical data"),
              itemLabel(context, "Favorite team selection."),
              itemLabel(
                  context, "League Tables for all major European leagues."),
              itemLabel(context, "Fast support times."),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("€2.29\nEvery Month",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        fontFamily: "Comfortaa")),
              ),
              Text("You will be charged €2.29 per calendar month.",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      fontFamily: "Comfortaa")),
              buttonPro()
            ],
          ),
         
        ],
      ),
    );
  }

  Widget itemLabel(BuildContext context, String text) {
    TextStyle kstyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontWeight: FontWeight.w600, fontFamily: "Comfortaa");
    return Column(
      children: [
        ListTile(
          leading: Icon(
            CupertinoIcons.check_mark,
            color: Theme.of(context).cardColor,
          ),
          title: Text(
            text,
            style: kstyle,
          ),
        ),
        divider(),
      ],
    );
  }

  Widget divider() {
    return Divider(
      height: 2,
      thickness: 0.7,
      indent: 40,
      endIndent: 10,
      color: Theme.of(context).dividerColor.withOpacity(0.1),
    );
  }

  Widget buttonPro() {
    final footyTheme = context.watch<FootballTheme>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FootballButton.raised(
            onTap: () {},
            backgroundColor:Theme.of(context).cardColor,
            text: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("Subscribe",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16 )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonProPlus() {
    final footyTheme = context.watch<FootballTheme>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: Helper.setWidth(context, factor: 0.44),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("€2.79\nEvery Month",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          fontFamily: "Comfortaa")),
                ),
                Container(
                  width: Helper.setWidth(context, factor: 0.44),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("€5.49\nEvery 3 Months",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          fontFamily: "Comfortaa")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: Helper.setWidth(context, factor: 0.44),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("You will be charged €2.79 per month.",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            fontFamily: "Comfortaa")),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: VerticalDivider(
                      thickness: 1,
                      width: 2,
                      color: Theme.of(context).dividerColor.withOpacity(0.7)),
                ),
                SizedBox(
                  width: Helper.setWidth(context, factor: 0.44),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("You will be charged €5.49 every 3 months.",
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            fontFamily: "Comfortaa")),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FootballButton.raised(
                  onTap: () {},
                  backgroundColor: footyTheme.alternateCardColor,
                  text: Text("Subscribe",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Theme.of(context).cardColor)),
                ),
                SizedBox(width: 20),
                FootballButton.raised(
                  onTap: () {},
                  backgroundColor: footyTheme.alternateCardColor,
                  text: Text("Subscribe",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Theme.of(context).cardColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget proPlusLifetime() {
    final footyTheme = context.watch<FootballTheme>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text("OR",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  fontFamily: "Comfortaa")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
              "Purchase Life Time With a One Time Payment,\nPay What You Want Starting From",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  fontFamily: "Comfortaa")),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text("€${_value.toStringAsFixed(2)}",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  fontFamily: "Comfortaa")),
        ),
        Slider(
            value: _value,
            min: 46.99,
            max: 140.97,
            divisions: 10,
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveColor: Theme.of(context).cardColor,
            // label: _value.toStringAsFixed(2),
            onChanged: (double newValue) {
              setState(() {
                _value = newValue;
              });
            },
            semanticFormatterCallback: (double newValue) {
              return '$newValue euros';
            }),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
              "*Please note that anything above €46.99 does not get you anything extra in terms of features.",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  fontFamily: "Comfortaa")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FootballButton.raised(
            onTap: () {},
            backgroundColor: footyTheme.alternateCardColor,
            text: SizedBox(
              width: Helper.setWidth(context),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text("Upgrade",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Theme.of(context).cardColor)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
