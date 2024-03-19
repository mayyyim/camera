import 'package:cameraApp/features/watermark/date_picker.dart';
import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatermarkEditBottomSheet extends ConsumerStatefulWidget {
  const WatermarkEditBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return WatermarkEditBottomSheetState();
  }
}

class WatermarkEditBottomSheetState
    extends ConsumerState<WatermarkEditBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final settingsList = [
      WatermarkSettingItem(
          text: "显示时间",
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => const DatePicker(),
            );
          },
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .day
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentDateVisible(!originVisible);
            });
          })
    ];

    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView.builder(
        itemCount: settingsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: settingsList[index].onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Switch(
                      value: ref
                          .read(watermarkEditProvider)
                          .currentWatermark
                          .watermarkUIObject
                          .day
                          .visible,
                      onChanged: (value) {
                        settingsList[index].switchTap();
                      },
                    ),
                    Text(settingsList[index].text),
                  ],
                ),
                Row(
                  children: [
                    settingsList[index].widget ?? Container(),
                    IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: () {
                        settingsList[index].onTap();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class WatermarkSettingItem {
  final String text;
  final Function() onTap;
  final Function() switchTap;
  final Widget? widget;

  WatermarkSettingItem({
    required this.text,
    required this.onTap,
    required this.switchTap,
    this.widget,
  });
}
