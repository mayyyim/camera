import 'dart:ui';

import 'package:cameraApp/model/watermark/watermark_data.dart';
import 'package:cameraApp/model/watermark/watermark_item.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/services/position_service.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark1.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatermarkState {
  final WatermarkItem? watermarkItem;
  final Offset position;
  final WatermarkUIObject watermarkUIObject;

  WatermarkState({
    required this.watermarkItem,
    required this.position,
    required this.watermarkUIObject,
  });

  Widget toWatermarkWidget() {
    Widget widget;
    if (watermarkItem != null) {
      switch (watermarkItem!.id) {
        case "1":
          widget = Watermark1(watermarkUIObject: watermarkUIObject);
          break;
        case "2":
          widget = Watermark2(watermarkUIObject: watermarkUIObject);
          break;
        default:
          widget = Watermark1(watermarkUIObject: watermarkUIObject);
          break;
      }
    } else {
      widget = Container();
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

  WatermarkEditState({required this.watermarks, this.currentIndex = 0});

  WatermarkState get currentWatermark {
    return watermarks[currentIndex];
  }

  WatermarkEditState copyWith({
    List<WatermarkState>? watermarks,
    int? currentIndex,
  }) {
    return WatermarkEditState(
      watermarks: watermarks ?? this.watermarks,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class WatermarkEditNotifier extends StateNotifier<WatermarkEditState> {
  WatermarkEditNotifier() : super(WatermarkEditState(watermarks: []));

  void addWatermark(WatermarkState watermark) {
    state = state.copyWith(
      watermarks: List.from(state.watermarks)..add(watermark),
    );
  }

  Future<int> initWatermark(int length) async {
    WatermarkData defaultData = WatermarkData(
        dateTime: DateTime.now(),
        position: await PositionService.getLocation());

    List<WatermarkState> watermarks = List.generate(
      length,
      (i) => WatermarkState(
        watermarkItem: WatermarkItem("2"),
        position: Offset.zero,
        watermarkUIObject: WatermarkUIObject.fromData(defaultData),
      ),
    );
    state = state.copyWith(watermarks: watermarks);
    return watermarks.length;
  }

  void removeWatermark(int index) {
    state = state.copyWith(
      watermarks: List.from(state.watermarks)..removeAt(index),
    );
  }

  void updateWatermark(int index, WatermarkState watermark) {
    state = state.copyWith(
      watermarks: List.from(state.watermarks)..[index] = watermark,
    );
  }

  void updateCurrentDate(DateTime dateTime) {
    List<WatermarkState> watermarks = state.watermarks;
    WatermarkUIObject newWatermarkUIObject =
        state.currentWatermark.watermarkUIObject.updateDateTime(dateTime);
    WatermarkState newWatermarkState = state.currentWatermark
        .copyWith(watermarkUIObject: newWatermarkUIObject);
    watermarks.replaceRange(
        state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  void updateCurrentDateVisible(bool visible) {
    List<WatermarkState> watermarks = state.watermarks;
    WatermarkUIObject watermarkUIObject =
        state.currentWatermark.watermarkUIObject.setTimeVisible(visible);
    WatermarkState newWatermarkState =
        state.currentWatermark.copyWith(watermarkUIObject: watermarkUIObject);
    watermarks.replaceRange(
        state.currentIndex, state.currentIndex + 1, [newWatermarkState]);
    state = state.copyWith(watermarks: watermarks);
  }

  void setCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

final watermarkEditProvider =
    StateNotifierProvider<WatermarkEditNotifier, WatermarkEditState>((ref) {
  return WatermarkEditNotifier();
});
