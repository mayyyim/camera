import 'dart:ui';

import 'package:cameraApp/model/watermark/text_object.dart';
import 'package:cameraApp/model/watermark/watermark_data.dart';
import 'package:cameraApp/model/watermark/watermark_item.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/services/position_service.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark1.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark10.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark11.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark111.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark12.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark14.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark15.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark16.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark17.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark18.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark19.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark2.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark20.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark21.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark23.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark24.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark25.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark26.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark28.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark29.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark3.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark31.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark30.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark32.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark33.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark34.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark37.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark38.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark4.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark40.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark42.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark45.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark49.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark5.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark53.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark6.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark62.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark65.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark67.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark69.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark7.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark71.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark74.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark78.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark8.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark81.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark82.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark9.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark95.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatermarkState {
  final WatermarkItem watermarkItem;
  final Offset position;
  final WatermarkUIObject watermarkUIObject;

  WatermarkState({
    required this.watermarkItem,
    required this.position,
    required this.watermarkUIObject,
  });

  WaterMarkWidget toWatermarkWidget() {
    WaterMarkWidget widget;
    print("MJ: test to widget id ${watermarkItem.id}");
    if (watermarkItem != null) {
      switch (watermarkItem.id) {
        case "1":
          widget = Watermark1(watermarkUIObject: watermarkUIObject);
          break;
        case "2":
          widget = Watermark2(watermarkUIObject: watermarkUIObject);
          break;
        case "3":
          widget = Watermark3(watermarkUIObject: watermarkUIObject);
          break;
        case "4":
          widget = Watermark4(watermarkUIObject: watermarkUIObject);
          break;
        case "5":
          widget = Watermark5(watermarkUIObject: watermarkUIObject);
          break;
        case "6":
          widget = Watermark6(watermarkUIObject: watermarkUIObject);
          break;
        case "7":
          widget = Watermark7(watermarkUIObject: watermarkUIObject);
          break;
        case "8":
          widget = Watermark8(watermarkUIObject: watermarkUIObject);
          break;
        case "9":
          widget = Watermark9(watermarkUIObject: watermarkUIObject);
          break;
        case "10":
          widget = Watermark10(watermarkUIObject: watermarkUIObject);
          break;
        case "11":
          widget = Watermark11(watermarkUIObject: watermarkUIObject);
          break;
        case "12":
          widget = Watermark12(watermarkUIObject: watermarkUIObject);
          break;
        case "14":
          widget = Watermark14(watermarkUIObject: watermarkUIObject);
          break;
        case "15":
          widget = Watermark15(watermarkUIObject: watermarkUIObject);
          break;
        case "16":
          widget = Watermark16(watermarkUIObject: watermarkUIObject);
          break;
        case "17":
          widget = Watermark17(watermarkUIObject: watermarkUIObject);
          break;
        case "18":
          widget = Watermark18(watermarkUIObject: watermarkUIObject);
          break;
        case "19":
          widget = Watermark19(watermarkUIObject: watermarkUIObject);
          break;
        case "20":
          widget = Watermark20(watermarkUIObject: watermarkUIObject);
          break;
        case "21":
          widget = Watermark21(watermarkUIObject: watermarkUIObject);
          break;
        case "23":
          widget = Watermark23(watermarkUIObject: watermarkUIObject);
          break;
        case "24":
          widget = Watermark24(watermarkUIObject: watermarkUIObject);
          break;
        case "25":
          widget = Watermark25(watermarkUIObject: watermarkUIObject);
          break;
        case "26":
          widget = Watermark26(watermarkUIObject: watermarkUIObject);
          break;
        case "28":
          widget = Watermark28(watermarkUIObject: watermarkUIObject);
          break;
        case "29":
          widget = Watermark29(watermarkUIObject: watermarkUIObject);
          break;
        case "30":
          widget = Watermark30(watermarkUIObject: watermarkUIObject);
          break;
        case "31":
          widget = Watermark31(watermarkUIObject: watermarkUIObject);
          break;
        case "32":
          widget = Watermark32(watermarkUIObject: watermarkUIObject);
          break;
        case "33":
          widget = Watermark33(watermarkUIObject: watermarkUIObject);
          break;
        case "34":
          widget = Watermark34(watermarkUIObject: watermarkUIObject);
          break;
        case "37":
          widget = Watermark37(watermarkUIObject: watermarkUIObject);
          break;
        case "38":
          widget = Watermark38(watermarkUIObject: watermarkUIObject);
          break;
        case "40":
          widget = Watermark40(watermarkUIObject: watermarkUIObject);
          break;

        case "42":
          widget = Watermark42(watermarkUIObject: watermarkUIObject);
          break;
        case "45":
          widget = Watermark45(watermarkUIObject: watermarkUIObject);
          break;
        case "49":
          widget = Watermark49(watermarkUIObject: watermarkUIObject);
          break;

        case "53":
          widget = Watermark53(watermarkUIObject: watermarkUIObject);
          break;

        case "62":
          widget = Watermark62(watermarkUIObject: watermarkUIObject);
          break;
        case "65":
          widget = Watermark65(watermarkUIObject: watermarkUIObject);
          break;
        case "67":
          widget = Watermark67(watermarkUIObject: watermarkUIObject);
          break;
        case "69":
          widget = Watermark69(watermarkUIObject: watermarkUIObject);
          break;
        case "71":
          widget = Watermark71(watermarkUIObject: watermarkUIObject);
          break;
        case "74":
          widget = Watermark74(watermarkUIObject: watermarkUIObject);
          break;
        case "78":
          widget = Watermark78(watermarkUIObject: watermarkUIObject);
          break;

        case "81":
          widget = Watermark81(watermarkUIObject: watermarkUIObject);
          break;

        case "82":
          widget = Watermark82(watermarkUIObject: watermarkUIObject);
          break;

        case "95":
          widget = Watermark95(watermarkUIObject: watermarkUIObject);
          break;
        case "111":
          widget = Watermark111(watermarkUIObject: watermarkUIObject);
          break;
        default:
          widget = Watermark1(watermarkUIObject: watermarkUIObject);
          break;
      }
    } else {
      widget = Watermark1(watermarkUIObject: watermarkUIObject);
    }
    return widget;
  }

  WatermarkState copyWith({
    WatermarkItem? watermarkItem,
    Offset? position,
    WatermarkUIObject? watermarkUIObject,
  }) {
    return WatermarkState(
      watermarkItem: watermarkItem ?? this.watermarkItem,
      position: position ?? this.position,
      watermarkUIObject: watermarkUIObject ?? this.watermarkUIObject,
    );
  }
}

class WatermarkEditState {
  final List<WatermarkState> watermarks;
  final int currentIndex;
  final bool showWatermark;

  WatermarkEditState({
    required this.watermarks,
    this.currentIndex = 0,
    this.showWatermark = true,
  });

  WatermarkState get currentWatermark {
    return watermarks[currentIndex];
  }

  WatermarkEditState copyWith({
    List<WatermarkState>? watermarks,
    int? currentIndex,
    bool? showWatermark,
  }) {
    return WatermarkEditState(
      watermarks: watermarks ?? this.watermarks,
      currentIndex: currentIndex ?? this.currentIndex,
      showWatermark: showWatermark ?? this.showWatermark,
    );
  }
}

class WatermarkEditNotifier extends StateNotifier<WatermarkEditState> {
  WatermarkEditNotifier() : super(WatermarkEditState(watermarks: []));

  Future<int> initWatermark({int length = 1, required Offset watermarkOffset}) async {
    // 设置默认值
    WatermarkData defaultData = WatermarkData(
      dateTime: DateTime.now(),
      position: await PositionService.getDefaultLocation(),
      weather: await PositionService.getDefaultWeather(),
    );
    List<WatermarkState> defaultWatermarks = List.generate(
      length,
      (i) => WatermarkState(
        watermarkItem: WatermarkItem(id: "1", tag: WatermarkTag.shijianjilu),
        position: Offset.zero,
        watermarkUIObject: WatermarkUIObject.fromData(defaultData),
      ),
    );
    state = state.copyWith(watermarks: defaultWatermarks);
    List<dynamic> results = await Future.wait([
      PositionService.getLocation(),
      PositionService.getWeather(),
    ]);

    String position = results[0];
    String weather = results[1];

    List<WatermarkState> watermarks = List.generate(
      length,
      (i) => WatermarkState(
        watermarkItem: WatermarkItem(id: "1", tag: WatermarkTag.shijianjilu),
        position: watermarkOffset,
        watermarkUIObject: WatermarkUIObject.fromData(defaultData.copyWith(
          position: position,
          weather: weather,
        )),
      ),
    );

    state = state.copyWith(watermarks: watermarks);
    return watermarks.length;
  }

  void updateCurrentFileWatermarkPosition(Offset watermarkPosition) {
    List<WatermarkState> watermarks = state.watermarks;
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(position: watermarkPosition);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  void updateWatermark(int index, WatermarkState watermark) {
    state = state.copyWith(
      watermarks: List.from(state.watermarks)..[index] = watermark,
    );
  }

  void updateShowWatermark(bool showWatermark) {
    state = state.copyWith(
      showWatermark: showWatermark,
    );
  }

  void updateCurrentDate(DateTime dateTime) {
    List<WatermarkState> watermarks = state.watermarks;
    WatermarkUIObject newWatermarkUIObject = state.currentWatermark.watermarkUIObject.updateDateTime(dateTime);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: newWatermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  void updateCurrentDateVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.setTimeVisible(visible);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新location可见性
  void updateCurrentLocalVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.setLocationVisible(visible);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新location信息
  void updateCurrentLocation(String location) {
    List<WatermarkState> watermarks = state.watermarks;
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.updateLocation(location);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新天气可见性
  void updateCurrentWeatherVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject weather = state.currentWatermark.watermarkUIObject.weather!.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(weather: weather);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新天气信息
  void updateCurrentWeather(String weatherString) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject weather = state.currentWatermark.watermarkUIObject.weather!.copyWith(text: weatherString);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(weather: weather);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新时间验证可见性
  void updateCurrentShijianyanzhengVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject shijianyanzheng =
        state.currentWatermark.watermarkUIObject.shijianyanzhengText!.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(shijianyanzhengText: shijianyanzheng);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新时间验证信息
  void updateCurrentShijianyanzheng(String shijianString) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject shijianyanzheng =
        state.currentWatermark.watermarkUIObject.shijianyanzhengText!.copyWith(text: shijianString);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(shijianyanzhengText: shijianyanzheng);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新经度可见性
  void updateCurrentJinduVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject jindu = state.currentWatermark.watermarkUIObject.jindu!.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(jindu: jindu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新jindu信息
  void updateCurrentJindu(String jinduString) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject jindu = state.currentWatermark.watermarkUIObject.jindu!.copyWith(text: jinduString);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(jindu: jindu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 纬度可见性
  void updateCurrentWeiduVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject weidu = state.currentWatermark.watermarkUIObject.weidu!.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(weidu: weidu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新纬度信息
  void updateCurrentWeidu(String weiduString) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject weidu = state.currentWatermark.watermarkUIObject.jindu!.copyWith(text: weiduString);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(weidu: weidu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新自定义可见性
  void updateCurrentCustomizedVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? customized = state.currentWatermark.watermarkUIObject.customized?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(customized: customized);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新自定义信息
  void updateCurrentCustomized(String customizedString) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? customized = state.currentWatermark.watermarkUIObject.customized?.copyWith(text: customizedString);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(customized: customized);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新备注可见性
  void updateCurrentBeizhuVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? beizhuText = state.currentWatermark.watermarkUIObject.beizhuText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(beizhuText: beizhuText);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 更新备注信息
  void updateCurrentBeizhu(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? beizhuText = state.currentWatermark.watermarkUIObject.customized?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(beizhuText: beizhuText);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 巡检人可见性
  void updateCurrentXunjianrenVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? xunjianren = state.currentWatermark.watermarkUIObject.xunjianrenText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(xunjianrenText: xunjianren);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 巡检人信息
  void updateCurrentXunjianren(String xunjianrenString) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? xunjianren = state.currentWatermark.watermarkUIObject.xunjianrenText?.copyWith(text: xunjianrenString);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(xunjianrenText: xunjianren);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 巡检区域可见性
  void updateCurrentXunjianquyuVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? xunjianquyu = state.currentWatermark.watermarkUIObject.xunjianquyuText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(xunjianquyuText: xunjianquyu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 巡检区域信息
  void updateCurrentXunjianquyu(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? xunjianquyu = state.currentWatermark.watermarkUIObject.xunjianquyuText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(xunjianquyuText: xunjianquyu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 巡检类型可见性
  void updateCurrentXunjianleixingVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? xunjianleixing =
        state.currentWatermark.watermarkUIObject.xunjianleixingText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(xunjianleixingText: xunjianleixing);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 巡检类型信息
  void updateCurrentXunjianleixing(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? xunjianleixing = state.currentWatermark.watermarkUIObject.xunjianleixingText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(xunjianleixingText: xunjianleixing);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 速度信息
  void updateCurrentSudu(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? suduText = state.currentWatermark.watermarkUIObject.suduText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(suduText: suduText);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// sudu可见性
  void updateSuduVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? sudu = state.currentWatermark.watermarkUIObject.suduText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(suduText: sudu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 添加自定义字段
  void updateCurrentTianjiazidingyi(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? tianjiazidingyi = state.currentWatermark.watermarkUIObject.tianjiazidingyixiang?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(tianjiazidingyixiang: tianjiazidingyi);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// sudu可见性
  void updateytianjiazidingyiVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? tianjiazidingyi =
        state.currentWatermark.watermarkUIObject.tianjiazidingyixiang?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(tianjiazidingyixiang: tianjiazidingyi);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 编号
  void updateCurrenBianhao(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? bianhao = state.currentWatermark.watermarkUIObject.bianhaoText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(bianhaoText: bianhao);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// bianhao可见性
  void updatebianhaoVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? bianhao = state.currentWatermark.watermarkUIObject.bianhaoText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(bianhaoText: bianhao);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 海拔信信息
  void updateCurrentHaiba(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? haiba = state.currentWatermark.watermarkUIObject.haibaText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(haibaText: haiba);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// haibakejianxing
  void updatehaibaVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? haiba = state.currentWatermark.watermarkUIObject.haibaText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(haibaText: haiba);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 手机号信息
  void updateCurrentshoujihao(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? shoujihao = state.currentWatermark.watermarkUIObject.shoujihaoText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(shoujihaoText: shoujihao);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 手机号可见性
  void updateshoujihaoVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? shoujihao = state.currentWatermark.watermarkUIObject.shoujihaoText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(shoujihaoText: shoujihao);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// IMEI信息
  void updateCurrentIMEI(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? imei = state.currentWatermark.watermarkUIObject.IMEIText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(IMEIText: imei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// IMEI可见性
  void updateIMEIVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? imei = state.currentWatermark.watermarkUIObject.IMEIText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(IMEIText: imei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 计数信息
  void updateCurrentjishu(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jishu = state.currentWatermark.watermarkUIObject.jishuText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(jishuText: jishu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// jishu可见性
  void updatejishuVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jishu = state.currentWatermark.watermarkUIObject.jishuText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(jishuText: jishu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 监理负责人信息
  void updateCurrentjianlifuzeren(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jianlifuzeren = state.currentWatermark.watermarkUIObject.jianlizerenrenText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(jianlizerenrenText: jianlifuzeren);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 监理负责人可见性
  void updatejianlifuzerenVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jianlifuzeren = state.currentWatermark.watermarkUIObject.jianlizerenrenText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(jianlizerenrenText: jianlifuzeren);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 竣工倒计时
  void updateCurrentjungongdaojishi(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jungongdaojishi = state.currentWatermark.watermarkUIObject.jungongdaojishiText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(jungongdaojishiText: jungongdaojishi);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 竣工倒计时可见性
  void updatejungongdaojishiVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jungong = state.currentWatermark.watermarkUIObject.jungongdaojishiText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(jungongdaojishiText: jungong);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 建设单位
  void updateCurrentjianshedanwei(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jianshedanwei = state.currentWatermark.watermarkUIObject.jianshedanweiText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(jianshedanweiText: jianshedanwei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 建设单位可见性
  void updatejianshedanweiVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jianshedanwei = state.currentWatermark.watermarkUIObject.jianshedanweiText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(jianshedanweiText: jianshedanwei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 监理单位
  void updateCurrentjianlidanwei(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jianlidanwei = state.currentWatermark.watermarkUIObject.jianlidanweiText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(jianlidanweiText: jianlidanwei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 监理单位可见性
  void updatejianlidanweiVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? jianlidanwei = state.currentWatermark.watermarkUIObject.jianlidanweiText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(jianlidanweiText: jianlidanwei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 设计单位
  void updateCurrentshejidanwei(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? shejidanwei = state.currentWatermark.watermarkUIObject.shejidanweiText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(shejidanweiText: shejidanwei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 设计单位可见性
  void updateshejidanweiVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? shejidanwei = state.currentWatermark.watermarkUIObject.shejidanweiText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(shejidanweiText: shejidanwei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 勘察单位
  void updateCurrentKanchadanwei(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? kanchadanwei = state.currentWatermark.watermarkUIObject.kanchadanweiText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(kanchadanweiText: kanchadanwei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 勘查单位可见性
  void updatekanchadanweiVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? kanchadanwei = state.currentWatermark.watermarkUIObject.kanchadanweiText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(kanchadanweiText: kanchadanwei);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 描述
  void updateCurrentmiaoshu(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? miaoshu = state.currentWatermark.watermarkUIObject.miaoshuText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(miaoshuText: miaoshu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 描述可见性
  void updatemiaoshuVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? miaoshu = state.currentWatermark.watermarkUIObject.miaoshuText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(miaoshuText: miaoshu);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 大标题
  void updateCurrentDabiaoti(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? dabiaoti = state.currentWatermark.watermarkUIObject.dabiaotiText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(dabiaotiText: dabiaoti);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 大标题可见性
  void updatedabiaotiVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? dabiaoti = state.currentWatermark.watermarkUIObject.dabiaotiText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject = state.currentWatermark.watermarkUIObject.copyWith(dabiaotiText: dabiaoti);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 小标题
  void updateCurrentXiaobiaoti(String string) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? xiaobiaoti = state.currentWatermark.watermarkUIObject.xiaobiaotxiText?.copyWith(text: string);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(xiaobiaotxiText: xiaobiaoti);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  /// 小标题可见性
  void updatexiaobiaotiVisibility(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    TextObject? xiaobiaoti = state.currentWatermark.watermarkUIObject.xiaobiaotxiText?.copyWith(visible: visible);
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.copyWith(xiaobiaotxiText: xiaobiaoti);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  void setCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  /// 更新当前的照片的水印
  void updateCurrentPhotoWatermark(String id) {
    List<WatermarkState> watermarks = state.watermarks;
    WatermarkItem watermarkItem = state.currentWatermark.watermarkItem.copyWith(id: id);
    WatermarkState newWatermarkState = state.currentWatermark.copyWith(watermarkItem: watermarkItem);
    watermarks.replaceRange(state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    print("MJ: test update watermark id is $id, after ${watermarks[state.currentIndex].watermarkItem.id}");
    state = state.copyWith(watermarks: watermarks);
  }
}

final watermarkEditProvider = StateNotifierProvider<WatermarkEditNotifier, WatermarkEditState>((ref) {
  return WatermarkEditNotifier();
});

class WatermarkVisibleMap {
  final bool dateTime; //时间
  final bool weidu; //纬度
  final bool jindu; //经度
  final bool position; //地点
  final bool weather; //天气
  final bool imageUrl;
  final bool customized; //自定义
  final bool dakabiaotiText; //打卡标题
  final bool beizhuText; //备注
  final bool shijianyanzhengText; //时间验证
  final bool gongchengmingchengText; // 工程名称
  final bool shigongdanweiText; //施工单位
  final bool xunjianrenText; //巡检人
  final bool xunjianleixingText; //巡检类型
  final bool xunjianquyuText; //巡检区域
  final bool zhuchirenText; // 主持人
  final bool suduText; //速度
  final bool tianjiazidingyixiang; //添加自定义项
  final bool bianhaoText; //编号
  final bool haibaText; //海拔
  final bool shoujihaoText; //手机号
  final bool IMEIText; //IMEI
  final bool jishuText; //计数
  final bool jianlizerenrenText; // 监理责任人
  final bool jungongdaojishiText; // 竣工倒计时
  final bool jianshedanweiText; //建设单位
  final bool jianlidanweiText; //监理单位
  final bool shejidanweiText; //设计单位
  final bool kanchadanweiText; //勘察单位
  final bool miaoshuText; // 描述
  final bool dabiaotiText; //大标题
  final bool xiaobiaotiText; // 小标题

  WatermarkVisibleMap({
    this.dateTime = false,
    this.position = false,
    this.weidu = false,
    this.jindu = false,
    this.weather = false,
    this.imageUrl = false,
    this.customized = false,
    this.dakabiaotiText = false,
    this.beizhuText = false,
    this.shijianyanzhengText = false,
    this.gongchengmingchengText = false,
    this.shigongdanweiText = false,
    this.xunjianrenText = false,
    this.xunjianleixingText = false,
    this.xunjianquyuText = false,
    this.zhuchirenText = false,
    this.suduText = false,
    this.tianjiazidingyixiang = true,
    this.bianhaoText = false,
    this.haibaText = false,
    this.shoujihaoText = false,
    this.IMEIText = false,
    this.jishuText = false,
    this.jianlizerenrenText = false,
    this.jungongdaojishiText = false,
    this.jianshedanweiText = false,
    this.jianlidanweiText = false,
    this.shejidanweiText = false,
    this.kanchadanweiText = false,
    this.miaoshuText = false,
    this.dabiaotiText = false,
    this.xiaobiaotiText = false,
  });
}
