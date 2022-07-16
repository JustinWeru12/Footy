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
    return SizedBox(
      width: Helper.setWidth(context),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset("assets/icons/placeholder.svg",
              fit: BoxFit.contain,
              height: height ?? Helper.setWidth(context, factor: 0.3),
              width: width ?? Helper.setWidth(context, factor: 0.4)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: "Comfortaa",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        )
      ]),
    );
  }
}
