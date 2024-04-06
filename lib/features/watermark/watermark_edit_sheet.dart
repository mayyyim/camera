import 'package:cameraApp/features/watermark/date_picker.dart';
import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/shared/Widget/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WatermarkEditBottomSheet extends ConsumerStatefulWidget {
  final WatermarkVisibleMap watermarkVisibleMap;

  const WatermarkEditBottomSheet(this.watermarkVisibleMap, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return WatermarkEditBottomSheetState();
  }
}

class WatermarkEditBottomSheetState
    extends ConsumerState<WatermarkEditBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final settingsList = [];

    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .dateTime) {
      settingsList.add(
        WatermarkSettingItem(
            text: "显示时间",
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const DatePicker(),
              );
            },
            value: ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .day
                .visible,
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
            }),
      );
    }

    /// add location setting
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .position) {
      settingsList.add(WatermarkSettingItem(
          text: "地点",
          onTap: () {
            context.push("/edit/地点");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .location!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .location!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentLocalVisible(!originVisible);
            });
          }));
    }

    /// 经度
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .jindu) {
      settingsList.add(WatermarkSettingItem(
          text: "经度",
          onTap: () {
            context.push("/edit/经度");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .jindu!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .jindu!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentJinduVisible(!originVisible);
            });
          }));
    }

    /// 纬度
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .weidu) {
      settingsList.add(
        WatermarkSettingItem(
          text: "纬度",
          onTap: () {
            context.push("/edit/纬度");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .weidu!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .weidu!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentWeiduVisible(!originVisible);
            });
          },
        ),
      );
    }

    /// 天气字段
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .weather) {
      settingsList.add(
        WatermarkSettingItem(
          text: "天气",
          onTap: () {
            context.push("/edit/天气");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .weather!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .weather!
                .visible;
            setState(
              () {
                ref
                    .read(watermarkEditProvider.notifier)
                    .updateCurrentWeatherVisible(!originVisible);
              },
            );
          },
        ),
      );
    }

    /// 时间验证字段
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .shijianyanzhengText) {
      settingsList.add(WatermarkSettingItem(
          text: "时间验证",
          onTap: () {
            context.push("/edit/时间验证");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .shijianyanzhengText!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .shijianyanzhengText!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentShijianyanzhengVisible(!originVisible);
            });
          }));
    }

    /// 自定义字段
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .customized) {
      settingsList.add(WatermarkSettingItem(
          text: "自定义字段",
          onTap: () {
            context.push("/edit/自定义");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .customized!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .customized!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentCustomizedVisible(!originVisible);
            });
          }));
    }

    /// 备注字段
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .beizhuText) {
      settingsList.add(WatermarkSettingItem(
          text: "备注",
          onTap: () {
            context.push("/edit/备注");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .beizhuText!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .beizhuText!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentBeizhuVisible(!originVisible);
            });
          }));
    }

    /// 巡检人字段
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .xunjianrenText) {
      settingsList.add(WatermarkSettingItem(
          text: "巡检人",
          onTap: () {
            context.push("/edit/巡检人");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .xunjianrenText!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .xunjianrenText!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentXunjianrenVisible(!originVisible);
            });
          }));
    }

    /// 巡检区域字段
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .xunjianquyuText) {
      settingsList.add(WatermarkSettingItem(
          text: "巡检区域",
          onTap: () {
            context.push("/edit/巡检区域");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .xunjianquyuText!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .xunjianquyuText!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentXunjianquyuVisible(!originVisible);
            });
          }));
    }

    /// 巡检类型字段
    ///
    if (ref
        .read(watermarkEditProvider)
        .currentWatermark
        .toWatermarkWidget()
        .watermarkVisibleMap
        .xunjianleixingText) {
      settingsList.add(WatermarkSettingItem(
          text: "巡检类型",
          onTap: () {
            context.push("/edit/巡检类型");
          },
          value: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .watermarkUIObject
              .xunjianleixingText!
              .visible,
          switchTap: () {
            bool originVisible = ref
                .read(watermarkEditProvider)
                .currentWatermark
                .watermarkUIObject
                .xunjianleixingText!
                .visible;
            setState(() {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentXunjianleixingVisible(!originVisible);
            });
          }));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.pop();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, width: 3, style: BorderStyle.solid),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ref
                      .watch(watermarkEditProvider)
                      .currentWatermark
                      .toWatermarkWidget() ??
                  Container(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: settingsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: GestureDetector(
                        onTap: settingsList[index].onTap,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Switch(
                                  value: settingsList[index].value,
                                  onChanged: (value) {
                                    settingsList[index].switchTap();
                                  },
                                ),
                                Text(settingsList[index].text),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                settingsList[index].widget ?? Container(),
                                IconButton(
                                  icon: const Icon(Icons.chevron_right),
                                  onPressed: () {
                                    settingsList[index].onTap();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    index == settingsList.length
                        ? Container()
                        : const SettingDivider()
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class WatermarkSettingItem {
  final String text;
  final Function() onTap;
  final Function() switchTap;
  final Widget? widget;
  final bool value;

  WatermarkSettingItem({
    required this.text,
    required this.onTap,
    required this.switchTap,
    this.widget,
    required this.value,
  });
}
