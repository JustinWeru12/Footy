import 'package:flutter/material.dart';

class Helper {
  static double setHeight(BuildContext context, {factor = 1}) {
    return MediaQuery.of(context).size.height * factor;
  }

  static double setWidth(BuildContext context, {factor = 1}) {
    return MediaQuery.of(context).size.width * factor;
  }

  static slideToPage(context, screen) {
    Navigator.push(context, SlideRightToLeft(page: screen));
  }

  static scaleToPage(context, screen) {
    Navigator.push(context, ScaleFromCenter(page: screen));
  }
}

class SlideRightToLeft extends PageRouteBuilder {
  final Widget page;
  SlideRightToLeft({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class ScaleFromCenter extends PageRouteBuilder {
  final Widget page;
  ScaleFromCenter({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            alignment: Alignment.center,
            scale:
                CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
            child: child,
          ),
        );
}
