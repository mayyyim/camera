import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingDivider extends StatelessWidget {
  final Color color;
  final double thickness;

  const SettingDivider(
      {super.key, this.color = const Color(0xFFF1F1F1), this.thickness = 0.5});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color,
    );
  }
}
