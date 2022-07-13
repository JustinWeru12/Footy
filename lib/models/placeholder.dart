import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football/models/helper.dart';

class PlaceholderWidget extends StatelessWidget {
  final double? height, width;
  final String label;
  const PlaceholderWidget({
    Key? key,
    this.height,
    this.width,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset("assets/icons/placeholder.svg",
          fit: BoxFit.contain,
          color: Theme.of(context).primaryColor,
          height: height ?? Helper.setWidth(context, factor: 0.42),
          width: width ?? Helper.setWidth(context, factor: 0.65)),
      Center(
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: "Comfortaa",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      )
    ]);
  }
}
