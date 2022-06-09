import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      this.text,
      this.height,
      this.onPressed,
      this.primaryColor,
      this.textColor})
      : super(key: key);
  final String? text;
  final Color? primaryColor, textColor;
  final double? height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 5.0,
                primary: primaryColor ?? Theme.of(context).cardColor,
                textStyle: const TextStyle(color: Colors.black87),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: Text(text!,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textColor ?? Colors.black,
                    fontSize: 20.0)),
            onPressed: onPressed),
      ),
    );
  }
}
