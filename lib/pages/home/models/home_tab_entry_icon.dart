import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTabEntryIcon extends StatelessWidget {
  const HomeTabEntryIcon(this.iconName, {this.size, Key? key})
      : super(key: key);

  /// The name that matches the icon data in [iconNameMap].
  final String? iconName;
  final double? size;

  /// Maps the name of an icon to its [IconData].
  static const Map<String, String> iconNameMap = <String, String>{
    // default
    'home': "assets/icons/home.svg",
    'tomorrow': "assets/icons/dice_1.svg",
    '2 days': "assets/icons/dice_2.svg",
    '3 days': "assets/icons/dice_3.svg",
    '4 days': "assets/icons/dice_4.svg",
    '5 days': "assets/icons/dice_5.svg",
    '6 days': "assets/icons/dice_6.svg",
  };

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconNameMap[iconName] ?? "assets/icons/home.svg",
      width: 20,
      height: 20,
      color: Theme.of(context).primaryColor,
      fit: BoxFit.contain,
    );
  }
}
