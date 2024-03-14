import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraSettings {
  final String videoResolution;
  final String photoResolution;
  final bool gridMode;
  final bool watermarkEnabled;
  final Duration delayTimer;
  final String aspectRatio;

  CameraSettings({
    required this.videoResolution,
    required this.photoResolution,
    required this.gridMode,
    required this.watermarkEnabled,
    required this.delayTimer,
    required this.aspectRatio,
  });

  CameraSettings copyWith({
    String? videoResolution,
    String? photoResolution,
    bool? gridMode,
    bool? watermarkEnabled,
    Duration? delayTimer,
    String? aspectRatio,
  }) {
    return CameraSettings(
      videoResolution: videoResolution ?? this.videoResolution,
      photoResolution: photoResolution ?? this.photoResolution,
      gridMode: gridMode ?? this.gridMode,
      watermarkEnabled: watermarkEnabled ?? this.watermarkEnabled,
      delayTimer: delayTimer ?? this.delayTimer,
      aspectRatio: aspectRatio ?? this.aspectRatio,
    );
  }
}

class CameraSettingsNotifier extends StateNotifier<CameraSettings> {
  CameraSettingsNotifier({required CameraSettings initialSettings})
      : super(initialSettings);

  void setVideoResolution(String resolution) {
    state = state.copyWith(videoResolution: resolution);
  }

  void setPhotoResolution(String resolution) {
    state = state.copyWith(photoResolution: resolution);
  }

  void toggleGridMode(bool isEnabled) {
    state = state.copyWith(gridMode: isEnabled);
  }

  void toggleWatermark(bool isEnabled) {
    state = state.copyWith(watermarkEnabled: isEnabled);
  }

  void setDelayTimer(Duration delay) {
    state = state.copyWith(delayTimer: delay);
  }

  void setAspectRatio(String ratio) {
    state = state.copyWith(aspectRatio: ratio);
  }
}

final cameraSettingsProvider =
    StateNotifierProvider<CameraSettingsNotifier, CameraSettings>((ref) {
  return CameraSettingsNotifier(
    initialSettings: CameraSettings(
      videoResolution: '1080P',
      // 默认值
      photoResolution: '1920x1440',
      // 默认值
      gridMode: false,
      // 默认值
      watermarkEnabled: true,
      // 默认值
      delayTimer: Duration(seconds: 0),
      // 默认值，没有延时
      aspectRatio: '4:3', // 默认值
    ),
  );
});
