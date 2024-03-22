import 'package:cameraApp/model/watermark/text_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeWidget extends ConsumerStatefulWidget {
  final TextObject hour;
  final TextObject minute;
  final Color textColor;
  final double textSize;

  const TimeWidget({
    super.key,
    required this.hour,
    required this.minute,
    this.textColor = Colors.white,
    this.textSize = 23,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return TimeWidgetState();
  }
}

class TimeWidgetState extends ConsumerState<TimeWidget> {
  late final TextEditingController hourController;
  late final TextEditingController minuteController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: widget.hour.visible,
          child: Text(
            widget.hour.text, // 第一行文本
            style: TextStyle(
              fontSize: widget.textSize,
              fontWeight: FontWeight.bold,
              color: widget.textColor,
            ),
          ),
        ),
        Visibility(
          visible: widget.hour.visible,
          child: Text(
            ":", // 第一行文本
            style: TextStyle(
              fontSize: widget.textSize,
              fontWeight: FontWeight.bold,
              color: widget.textColor,
            ),
          ),
        ),
        Visibility(
          visible: widget.minute.visible,
          child: Text(
            widget.minute.text, // 第一行文本
            style: TextStyle(
              fontSize: widget.textSize,
              fontWeight: FontWeight.bold,
              color: widget.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
