import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Import material.dart for using buttons
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DatePicker extends ConsumerStatefulWidget {
  const DatePicker({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return DatePickerState();
  }
}

class DatePickerState extends ConsumerState<DatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).copyWith().size.height / 3,
      child: Column(
        children: [
          // 添加按钮行
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                child: const Text('取消'),
                onPressed: () => Navigator.of(context).pop(), // 关闭BottomSheet
              ),
              CupertinoButton(
                child: const Text('确定'),
                onPressed: () {
                  final formattedDate = DateFormat('yyyy-MM-dd – EEE – kk:mm')
                      .format(selectedDate);
                  Navigator.of(context).pop(selectedDate);
                  ref
                      .read(watermarkEditProvider.notifier)
                      .updateCurrentDate(selectedDate);
                },
              ),
            ],
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              onDateTimeChanged: (DateTime newDate) {
                // 只更新状态，不关闭BottomSheet
                selectedDate = DateTime(
                  newDate.year,
                  newDate.month,
                  newDate.day,
                  selectedDate.hour,
                  selectedDate.minute,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
