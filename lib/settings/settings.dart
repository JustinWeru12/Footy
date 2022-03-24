import 'package:flutter/material.dart';
import 'package:football/widgets/widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1d1d1d),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(19, 175, 175, 1)),
                ),
              ),
              Settings(
                  icon: Icons.build_outlined,
                  title: "Favourite Leagues",
                  subtitle:
                      "Select your Favourite League you want\nto displayed in the My League Menu"),
              Divider(
                color: Colors.grey,
              ),
              Settings(
                  icon: Icons.feed_outlined,
                  title: "News Settings",
                  subtitle:
                      "Select your Favourite League you want\nto displayed in the My League Menu"),
              Divider(
                color: Colors.grey,
              ),
              Settings(
                  icon: Icons.cloud_upload_outlined,
                  title: "Backup League Settings",
                  subtitle:
                      "Select your Favourite League you want\nto displayed in the My League Menu"),
              Divider(
                color: Colors.grey,
              ),
              Settings(
                  icon: Icons.location_on_outlined,
                  title: "Preferred region",
                  subtitle:
                      "Select your Favourite League you want\nto displayed in the My League Menu"),
              Divider(
                color: Colors.grey,
              ),
              Settings(
                  icon: Icons.notifications_outlined,
                  title: "Push notifications",
                  subtitle: "Get push notifications and alerts?"),
              Divider(
                color: Colors.grey,
              ),
              Settings(
                  icon: Icons.settings_outlined,
                  title: "Default League Menu",
                  subtitle: "All League Menu"),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Others",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(19, 175, 175, 1)),
                ),
              ),
              Settings(
                  icon: Icons.g_translate_outlined,
                  title: "Help Translate",
                  subtitle:
                      "Use Crowdln.net to translate this app\n(Get a first Promo code"),
              Divider(
                color: Colors.grey,
              ),
              Settings(
                  icon: Icons.sms_failed_outlined,
                  title: "About",
                  subtitle: "About Developer and App version"),
            ],
          ),
        ),
      ),
    );
  }
}
