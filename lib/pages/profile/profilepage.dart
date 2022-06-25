import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:football/api/crud.dart';
import 'package:football/classes/leagues.dart';
import 'package:football/models/helper.dart';
import 'package:football/pages/login/model/button.dart';
import 'package:football/pages/profile/models/select_profile_picture.dart';
import 'package:football/services/default_spacer.dart';
import 'package:football/services/theme/footy_theme.dart';
import 'package:football/services/user_auth/user.dart';
import 'package:football/widgets/footy_circle_avatar.dart';
import 'package:football/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class ProfilePage extends StatefulWidget {
  final UserData userData;
  const ProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool enableNotifications = false, islive = false;
  CrudMethods crudObj = CrudMethods();
  Future<LeagueList>? leagues;
  List<dynamic> favoriteLeagues = [], favoriteLeagueIds = [];

  @override
  Widget build(BuildContext context) {
    final footyTheme = context.watch<FootballTheme>();
    return FootballScaffold(
        title: "Profile",
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: entries(footyTheme),
        ));
  }

  Widget entries(FootballTheme theme) {
    Widget header(userData) {
      return InkWell(
        borderRadius: kBorderRadius,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () => _openModalBottomSheet(context),
                  child: FootballCircleAvatar(
                    radius: 35,
                    imageUrl: userData["picture"] ??
                        "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                  ),
                ),
                horizontalSpacer,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData["fullNames"] ?? "John Doe",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      smallVerticalSpacer,
                      Text(
                        userData["email"] ?? 'johndoe@gmail.com',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(widget.userData.userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                header(snapshot.data),
                verticalSpacer,
                verticalSpacer,
                FootballListCard(
                    leading: const Icon(CupertinoIcons.sportscourt),
                    title: const Text(
                      'Favorite Leagues',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      snapshot.data!["favLeagues"].isNotEmpty
                          ? snapshot.data!["favLeagues"].join(" | ")
                          : "No Favorite Leagues Added",
                    ),
                    onTap: () {
                      setState(() {
                        leagues ??= crudObj.getLeagues();
                        favoriteLeagues = snapshot.data!["favLeagues"] ?? [];
                        favoriteLeagueIds =
                            snapshot.data!["favLeagueIds"] ?? [];
                        showModalBottom(theme.alternateCardColor);
                      });
                    }),
                // verticalSpacer,
                // FootballListCard(
                //     leading: const Icon(FeatherIcons.heart),
                //     title: const Text(
                //       'Favorite Teams',
                //       style: TextStyle(fontWeight: FontWeight.w600),
                //     ),
                //     subtitle: Text(
                //       snapshot.data!["favTeams"].isNotEmpty
                //           ? snapshot.data!["favTeams"].join(" | ")
                //           : "No Favorite Teams Added",
                //     ),
                //     onTap: () {}),
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
                    subtitle: Text(
                      snapshot.data!["liveOnly"]
                          ? 'Only show games that broadcast live for your region'
                          : 'All matches will show',
                    ),
                    trailing: Switch.adaptive(
                        value: snapshot.data!["liveOnly"] ?? islive,
                        onChanged: (val) {
                          setState(() {
                            islive = val;
                            crudObj.createOrUpdateUserData({"liveOnly": val});
                          });
                        }),
                    onTap: () {}),
                verticalSpacer,
                FootballListCard(
                    leading: const Icon(FeatherIcons.tv),
                    title: const Text(
                      'Region',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'Show TV channels from your region(${snapshot.data!["region"]}).',
                    ),
                    trailing: Switch.adaptive(
                        value: snapshot.data!["regionOnly"] ?? islive,
                        onChanged: (val) {
                          setState(() {
                            islive = val;
                            crudObj.createOrUpdateUserData({"regionOnly": val});
                          });
                        }),
                    onTap: () {}),
                verticalSpacer,
                FootballListCard(
                    leading: const Icon(CupertinoIcons.bell),
                    title: const Text(
                      'Enable Push Notifications',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      snapshot.data!["notify"]
                          ? 'Get alerts and notifications'
                          : "You will not get alerts and notifications",
                    ),
                    trailing: Switch.adaptive(
                        value: snapshot.data!["notify"] ?? enableNotifications,
                        onChanged: (val) {
                          setState(() {
                            enableNotifications = val;
                            crudObj.createOrUpdateUserData({"notify": val});
                          });
                        }),
                    onTap: () {}),
                verticalSpacer,
              ],
            );
          } else {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: Helper.setHeight(context, factor: 0.15),
                    width: Helper.setHeight(context, factor: 0.15),
                    child: const Center(
                      child: RiveAnimation.asset(
                        'assets/rive/animated_icon.riv',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Text("Loading....", style: TextStyle(fontSize: 20)),
                ],
              ),
            );
          }
        });
  }

  showModalBottom(cardColor) {
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Container(
                color: Theme.of(context).backgroundColor,
                // height: Helper.setHeight(context, factor: 0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FutureBuilder<LeagueList>(
                      future: leagues,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.data.isNotEmpty
                              ? MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child: snapshot.data!.data.isEmpty
                                      ? const Center(
                                          child: Text("No Leagues",
                                              style: TextStyle(fontSize: 20)),
                                        )
                                      : ListView.builder(
                                          itemCount: snapshot.data!.data.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: FootballListCard(
                                                  title: Text(snapshot
                                                          .data!.data[i].name ??
                                                      "League"),
                                                  trailing: IconButton(
                                                      onPressed: () {
                                                        if (favoriteLeagues
                                                            .contains(snapshot
                                                                .data!
                                                                .data[i]
                                                                .name)) {
                                                          setState(() {
                                                            favoriteLeagues
                                                                .remove(snapshot
                                                                    .data!
                                                                    .data[i]
                                                                    .name!);
                                                            favoriteLeagueIds
                                                                .remove(snapshot
                                                                    .data!
                                                                    .data[i]
                                                                    .id!);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            favoriteLeagues.add(
                                                                snapshot
                                                                    .data!
                                                                    .data[i]
                                                                    .name!);
                                                            favoriteLeagueIds
                                                                .add(snapshot
                                                                    .data!
                                                                    .data[i]
                                                                    .id!);
                                                          });
                                                        }
                                                      },
                                                      icon: Icon(
                                                          favoriteLeagues
                                                                  .contains(
                                                                      snapshot
                                                                          .data!
                                                                          .data[
                                                                              i]
                                                                          .name)
                                                              ? CupertinoIcons
                                                                  .heart_fill
                                                              : CupertinoIcons
                                                                  .heart,
                                                          color: Colors.red,
                                                          size: 20))),
                                            );
                                          }),
                                )
                              : const Center(
                                  child: Text("No Leagues",
                                      style: TextStyle(fontSize: 20)),
                                );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text("snapshot error",
                                style: TextStyle(fontSize: 20)),
                          );
                        } else {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      Helper.setHeight(context, factor: 0.15),
                                  width:
                                      Helper.setHeight(context, factor: 0.15),
                                  child: const Center(
                                    child: RiveAnimation.asset(
                                      'assets/rive/animated_icon.riv',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const Text("Loading....",
                                    style: TextStyle(fontSize: 20)),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        horizontalSpacer,
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: cardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5.0),
                          label: Text("Update",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor)),
                          icon: Icon(CupertinoIcons.checkmark_alt,
                              color: Theme.of(context).primaryColor),
                          onPressed: () {
                            crudObj.createOrUpdateUserData({
                              "favLeagues": favoriteLeagues,
                              "favLeagueIds": favoriteLeagueIds
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        horizontalSpacer,
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: cardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5.0),
                          icon: Icon(CupertinoIcons.clear,
                              color: Theme.of(context).primaryColor),
                          label: Text("Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        horizontalSpacer,
                      ],
                    ),
                    verticalSpacer,
                  ],
                ),
              ),
            );
          });
        });
  }

  void _openModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const SelectProfilePicture(),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
          );
        });
  }
}
