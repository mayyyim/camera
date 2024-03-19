import 'dart:async';

import 'package:camera/camera.dart';
import 'package:cameraApp/shared/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

enum CameraMode {
  photo,
  video,
}

enum CameraAspectRatio {
  one, // 1:1
  two, // 4:3
  three // 16:9
}

class CameraState {
  final CameraController? cameraController;
  final bool isInitialized;
  final FlashMode flashMode;
  final XFile? pictureFile;
  final List<CameraDescription> cameras; // 可用摄像头的列表
  final int selectedCameraIndex; // 当前选中的摄像头索引
  final CameraMode cameraMode;
  final CameraAspectRatio cameraAspectRatio;
  final int delayInSecond;
  final String clarity;

  CameraState({
    this.cameraController,
    this.isInitialized = false,
    this.flashMode = FlashMode.auto,
    this.pictureFile,
    this.cameras = const [],
    this.selectedCameraIndex = 0,
    this.cameraMode = CameraMode.photo,
    this.cameraAspectRatio = CameraAspectRatio.two,
    this.delayInSecond = 0,
    this.clarity = '720p',
  });

  CameraState copyWith({
    CameraController? cameraController,
    bool? isInitialized,
    FlashMode? flashMode,
    XFile? pictureFile,
    List<CameraDescription>? cameras,
    int? selectedCameraIndex,
    CameraMode? cameraMode,
    CameraAspectRatio? cameraAspectRatio,
    int? delayInSecond,
    String? clarity,
  }) {
    return CameraState(
      cameraController: cameraController ?? this.cameraController,
      isInitialized: isInitialized ?? this.isInitialized,
      flashMode: flashMode ?? this.flashMode,
      pictureFile: pictureFile ?? this.pictureFile,
      cameras: cameras ?? this.cameras,
      selectedCameraIndex: selectedCameraIndex ?? this.selectedCameraIndex,
      cameraMode: cameraMode ?? this.cameraMode,
      cameraAspectRatio: cameraAspectRatio ?? this.cameraAspectRatio,
      delayInSecond: delayInSecond ?? this.delayInSecond,
      clarity: clarity ?? this.clarity,
    );
  }
}

class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier() : super(CameraState()) {
    _initializeCamera();
  }

  List<CameraDescription>? _availableCameras;
  CameraDescription? _currentCamera;

  Future<void> _initializeCamera() async {
    _availableCameras = await availableCameras();
    _currentCamera = _availableCameras!.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );
    print("MJ: test init camera  is android ${GlobalData.isAndroid}");

    final cameraController = CameraController(
        _currentCamera!, ResolutionPreset.high,
        imageFormatGroup: GlobalData.isAndroid
            ? ImageFormatGroup.yuv420
            : ImageFormatGroup.bgra8888);

    await cameraController.initialize();
    state =
        state.copyWith(cameraController: cameraController, isInitialized: true);
  }

  void toggleMode() {
    final newMode = state.cameraMode == CameraMode.photo
        ? CameraMode.video
        : CameraMode.photo;
    state = state.copyWith(cameraMode: newMode);
  }

  // 拍照功能
  Future<XFile?> takePicture() async {
    if (!state.isInitialized) return null;
    ImageFormatGroup imageFormatGroup;
    switch (state.cameraAspectRatio) {
      case CameraAspectRatio.one:
        imageFormatGroup = ImageFormatGroup.jpeg;
        break;
      case CameraAspectRatio.two:
        imageFormatGroup = ImageFormatGroup.yuv420;
        break;
      case CameraAspectRatio.three:
        imageFormatGroup = ImageFormatGroup.bgra8888;
        break;
      default:
        imageFormatGroup = ImageFormatGroup.bgra8888;
        break;
    }
    // 设置了延时
    XFile? pictureFile;
    Timer(Duration(seconds: state.delayInSecond), () async {
      pictureFile = await state.cameraController!.takePicture();
      state = state.copyWith(pictureFile: pictureFile);
    });
    return pictureFile;
  }

  void updateAspectRatio(CameraAspectRatio cameraAspectRatio) {
    state = state.copyWith(cameraAspectRatio: cameraAspectRatio);
  }

  void updateDelay(int delay) {
    state = state.copyWith(delayInSecond: delay);
  }

  // 设置了视频清晰度
  void updateVideoClarity(String clarity) {
    ResolutionPreset resolutionPreset;
    switch (clarity) {
      case "480p":
        resolutionPreset = ResolutionPreset.low;
        break;
      case "720p":
        resolutionPreset = ResolutionPreset.medium;
        break;
      case "1080p":
        resolutionPreset = ResolutionPreset.high;
        break;
      default:
        resolutionPreset = ResolutionPreset.medium;
        break;
    }
    var currentCamera = _availableCameras!.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    state = state.copyWith(
        cameraController: CameraController(currentCamera, resolutionPreset),
        clarity: clarity);
  }

  Future<void> setFlashMode(FlashMode mode) async {
    try {
      print("MJ: test set flash mode ${mode}");
      if (!state.isInitialized || state.cameraController == null) return;

      await state.cameraController!.setFlashMode(mode);
      print("MJ: test after set flash is ${state.flashMode},");

      state = state.copyWith(flashMode: mode);
    } catch (e) {
      print("MJ: Error setting flash mode: $e");
    }
  }

  Future<void> flipCamera() async {
    if (_availableCameras == null || _availableCameras!.isEmpty) {
      _availableCameras = await availableCameras();
    }

    if (_currentCamera == null || state.cameraController == null) return;

    final lensDirection = state.cameraController!.description.lensDirection;
    CameraDescription newCamera = _availableCameras!.firstWhere(
      (camera) => camera.lensDirection != lensDirection,
      orElse: () => _availableCameras!.first,
    );

    if (newCamera != _currentCamera) {
      await state.cameraController?.dispose();

      // 初始化新的摄像头
      CameraController newController = CameraController(
        newCamera,
        ResolutionPreset.medium,
      );
      await newController.initialize();

      // 更新状态
      state = state.copyWith(
        cameraController: newController,
        isInitialized: true,
      );
      _currentCamera = newCamera;
    }
  }

  Future<List<XFile>> pickPhotos(WidgetRef ref) async {
    // 选择相册图片
    final ImagePicker _picker = ImagePicker();
    List<XFile> imageFiles = [];
    try {
      imageFiles = await _picker.pickMultiImage(imageQuality: 9);
    } catch (error) {
      if (error.toString().contains("photo_access_denied")) {}
    }
    return imageFiles;
  }

  @override
  void dispose() {
    state.cameraController?.dispose();
    super.dispose();
  }
}

final cameraProvider = StateNotifierProvider<CameraNotifier, CameraState>(
  (ref) => CameraNotifier(),
);
