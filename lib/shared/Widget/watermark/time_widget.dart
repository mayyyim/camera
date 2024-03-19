import 'package:cameraApp/model/watermark/text_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeWidget extends ConsumerStatefulWidget {
  final TextObject hour;
  final TextObject minute;

  const TimeWidget({super.key, required this.hour, required this.minute});

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
      children: [
        Visibility(
          visible: widget.hour.visible,
          child: Text(
            widget.hour.text, // 第一行文本
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Visibility(
          visible: widget.hour.visible,
          child: const Text(
            ":", // 第一行文本
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Visibility(
          visible: widget.minute.visible,
          child: Text(
            widget.minute.text, // 第一行文本
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
