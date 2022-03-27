import 'package:football/football.dart';
import 'package:football/services/global_provider.dart';
import 'package:football/services/service_locator.dart';
import 'package:flutter/material.dart';

/// The app can be built with the 'free' or 'pro' flavor by running
/// `flutter run --flavor free --dart-define=flavor=free` or
/// `flutter run --flavor pro --dart-define=flavor=pro` respectively.
///
/// Additionally a twitter api key is required for authentication and can be
/// specified using
/// `--dart-define=twitter_consumer_key=your_consumer_key` and
/// `--dart-define=twitter_consumer_secret=your_consumer_secret`.
void main() {
  setupServices();
  runApp(
    const GlobalProvider(
      child: FootballApp(),
    ),
  );
}
