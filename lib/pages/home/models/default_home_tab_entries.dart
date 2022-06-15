import 'package:football/pages/home/models/home_tab_entry.dart';

/// The default entries for the [HomeTabView] that determine the default
/// views in the home screen.
List<HomeTabEntry> defaultHomeTabEntries = <HomeTabEntry>[
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
    name: '2 days',
  ),
  HomeTabEntry(
    id: '3 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '3 days',
    name: '3 days',
  ),
  HomeTabEntry(
    id: '4 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '4 days',
    name: '4 days',
  ),
  HomeTabEntry(
    id: '5 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '5 days',
    name: '5 days',
  ),
  HomeTabEntry(
    id: '6 days',
    type: HomeTabEntryType.defaultType.value,
    icon: '6 days',
    name: '6 days',
  ),
];
