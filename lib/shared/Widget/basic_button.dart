import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const BasicButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 80,
        height: 45,
        decoration: BoxDecoration(color: backgroundColor ?? Colors.blue),
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
