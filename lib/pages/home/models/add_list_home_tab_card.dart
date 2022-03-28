import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/services/theme/harpy_theme.dart';
import 'package:football/widgets/widgets.dart';

class AddListHomeTabCard extends StatelessWidget {
  const AddListHomeTabCard({this.proDisabled = false, Key? key})
      : super(key: key);

  /// Whether the add new list card should appear disabled with a pro icon
  /// bubble.
  ///
  /// This indicates that only the pro version can add more lists.
  final bool proDisabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final model = context.watch<HomeTabModel>();

    final iconSize = theme.iconTheme.size!;

    final Widget icon = Padding(
      padding: EdgeInsets.all(FootballTab.tabPadding(context)),
      child: Icon(CupertinoIcons.add, size: iconSize),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: kBorderRadius,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: kBorderRadius,
        child: Row(
          children: [
            icon,
            Expanded(
              child: Text(
                proDisabled ? 'add more lists with harpy pro' : 'add list',
                style: theme.textTheme.subtitle1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
