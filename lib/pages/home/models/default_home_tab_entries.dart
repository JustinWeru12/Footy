import 'package:football/pages/home/models/home_tab_entry.dart';
import 'package:intl/intl.dart';

/// The default entries for the [HomeTabView] that determine the default
/// views in the home screen.
List<HomeTabEntry> defaultHomeTabEntries = <HomeTabEntry>[
  HomeTabEntry(
      id: '-2 days',
      type: HomeTabEntryType.defaultType.value,
      icon: '2 days',
      name: DateFormat('EEE')
          .format(
            DateTime.now().subtract(const Duration(days: 2)),
          )
          .toLowerCase()),
  HomeTabEntry(
    id: '-1 day',
    type: HomeTabEntryType.defaultType.value,
    icon: 'tomorrow',
    name: 'yesterday',
  ),
  HomeTabEntry(
    id: 'today',
    type: HomeTabEntryType.defaultType.value,
    icon: 'home',
    name: 'today',
  ),
  HomeTabEntry(
    id: 'tomorrow',
    type: HomeTabEntryType.defaultType.value,
    name: 'tomorrow',
    icon: 'tomorrow',
  ),
  HomeTabEntry(
    id: '2 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '2 days',
    name: DateFormat('EEE')
        .format(
          DateTime.now().add(const Duration(days: 2)),
        )
        .toLowerCase(),
  ),
  HomeTabEntry(
    id: '3 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '3 days',
    name: DateFormat('EEE')
        .format(
          DateTime.now().add(const Duration(days: 3)),
        )
        .toLowerCase(),
  ),
  HomeTabEntry(
    id: '4 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '4 days',
    name: DateFormat('EEE')
        .format(
          DateTime.now().add(const Duration(days: 4)),
        )
        .toLowerCase(),
  ),
  HomeTabEntry(
    id: '5 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '5 days',
    name: DateFormat('EEE')
        .format(
          DateTime.now().add(const Duration(days: 5)),
        )
        .toLowerCase(),
  ),
  HomeTabEntry(
    id: '6 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '6 days',
    name: DateFormat('EEE')
        .format(
          DateTime.now().add(const Duration(days: 6)),
        )
        .toLowerCase(),
  ),
];
