import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalStick extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const VerticalStick(
      {super.key,
      this.height = 20,
      this.width = 2,
      this.color = Colors.yellow});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
