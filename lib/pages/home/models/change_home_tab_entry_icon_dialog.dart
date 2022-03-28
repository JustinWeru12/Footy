import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/pages/home/models/home_tab_entry.dart';
import 'package:football/pages/home/models/home_tab_entry_icon.dart';
import 'package:football/widgets/widgets.dart';

class ChangeHomeTabEntryIconDialog extends StatelessWidget {
  const ChangeHomeTabEntryIconDialog({required this.entry, Key? key})
      : super(key: key);

  final HomeTabEntry entry;

  Widget _buildButton(BuildContext context, String iconName) {
    if (iconName == entry.icon) {
      return FootballButton.raised(
        padding: const EdgeInsets.all(8),
        icon: HomeTabEntryIcon(iconName),
        onTap: () => Navigator.of(context).pop(),
      );
    } else {
      return FootballButton.flat(
        padding: const EdgeInsets.all(8),
        icon: HomeTabEntryIcon(iconName),
        onTap: () => Navigator.of(context).pop<String>(iconName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FootballDialog(
      title: Text('${entry.name} icon'),
      content: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          if (entry.hasName) _buildButton(context, entry.name![0]),
          for (String iconName in HomeTabEntryIcon.iconNameMap.keys)
            _buildButton(context, iconName)
        ],
      ),
    );
  }
}
