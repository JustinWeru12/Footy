import 'package:flutter/material.dart';

const bgColor = Color(0xFF212332);

class FootyTheme {
  ThemeData crow = ThemeData(
    scaffoldBackgroundColor: const Color(0xff12254A),
    primaryColor: const Color(0xfff3aa2f),
    canvasColor: const Color(0xff4689ff),
    cardColor: const Color(0xff1c85df),
  );

  ThemeData swan = ThemeData(
    scaffoldBackgroundColor: const Color(0xffffffff),
    primaryColor: const Color(0xff216eee),
    canvasColor: const Color(0xff4b8bfd),
    cardColor: const Color(0xff618de3),
  );

  ThemeData harpy = ThemeData(
    scaffoldBackgroundColor: const Color(0xff880e4f),
    primaryColor: const Color(0xff880E4F),
    canvasColor: const Color(0xffff6ffe),
    cardColor: const Color(0xff4f148b),
  );

  ThemeData nord = ThemeData(
    scaffoldBackgroundColor: const Color(0xff2E3440),
    primaryColor: const Color(0xff5E81AC),
    canvasColor: const Color(0xff88C0D0),
    cardColor: const Color(0xff5e81ac),
  );

  ThemeData dracula = ThemeData(
    scaffoldBackgroundColor: const Color(0xff282A36),
    primaryColor: const Color(0xffBD93F9),
    canvasColor: const Color(0xffCAA9FA),
    cardColor: const Color(0xffBD93F9),
  );

  ThemeData monokai = ThemeData(
    scaffoldBackgroundColor: const Color(0xff101010),
    primaryColor: const Color(0xff66aa11),
    canvasColor: const Color(0xffff0090),
    cardColor: const Color(0xff3579a8),
  );
}

showDialogCustom(BuildContext context, String button) {
// flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
// return object of type Dialog
      return AlertDialog(
        title: Row(
          children: [
            Image.asset('assets/images/finalNotice.png'),
            const Text('Important note.'),
          ],
        ),
        content: const Text(
          'Please note: this app is NOT for watching illegal TV streams.it is a guide to all live fooball on your television. Please rate the app accordingly. \n Thank you so much for your support and interest in our app. Enjoy your football :)',
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
// usually buttons at the bottom of the dialog
// ignore: deprecatedmemberuse
          TextButton(
            child: Text(button),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
