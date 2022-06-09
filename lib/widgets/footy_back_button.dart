import 'package:flutter/cupertino.dart';
import 'package:football/widgets/widgets.dart';

class FootballBackButton extends StatelessWidget {
  const FootballBackButton({
    this.color,
    Key? key,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FootballButton.flat(
      padding: const EdgeInsets.all(16),
      foregroundColor: color,
      icon: Transform.translate(
        offset: const Offset(-1, 0),
        child: const Icon(CupertinoIcons.left_chevron),
      ),
      onTap: Navigator.of(context).maybePop,
    );
  }
}
