import 'package:firebase_core/firebase_core.dart';
import 'package:football/football.dart';
import 'package:football/services/global_provider.dart';
import 'package:football/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

/// The app can be built with the 'free' or 'pro' flavor by running
/// `flutter run --flavor free --dart-define=flavor=free` or
/// `flutter run --flavor pro --dart-define=flavor=pro` respectively.
///
/// Additionally a twitter api key is required for authentication and can be
/// specified using
/// `--dart-define=twitter_consumer_key=your_consumer_key` and
/// `--dart-define=twitter_consumer_secret=your_consumer_secret`.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase
      .initializeApp(); //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("e8ed39ea-e36e-4c97-91f5-f465ed7d1646");
// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  setupServices();
  runApp(
    const GlobalProvider(
      child: FootballApp(),
    ),
  );
}
