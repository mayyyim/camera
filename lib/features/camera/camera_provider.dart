import 'package:camera/camera.dart';
import 'package:cameraApp/features/photo/photo_edit_provider.dart';
import 'package:cameraApp/shared/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

enum CameraMode {
  photo,
  video,
}

class CameraState {
  final CameraController? cameraController;
  final bool isInitialized;
  final FlashMode flashMode;
  final XFile? pictureFile;
  final List<CameraDescription> cameras; // 可用摄像头的列表
  final int selectedCameraIndex; // 当前选中的摄像头索引
  final CameraMode cameraMode;

  CameraState({
    this.cameraController,
    this.isInitialized = false,
    this.flashMode = FlashMode.auto,
    this.pictureFile,
    this.cameras = const [],
    this.selectedCameraIndex = 0,
    this.cameraMode = CameraMode.photo,
  });

  CameraState copyWith({
    CameraController? cameraController,
    bool? isInitialized,
    FlashMode? flashMode,
    XFile? pictureFile,
    List<CameraDescription>? cameras,
    int? selectedCameraIndex,
    CameraMode? cameraMode,
  }) {
    return CameraState(
      cameraController: cameraController ?? this.cameraController,
      isInitialized: isInitialized ?? this.isInitialized,
      flashMode: flashMode ?? this.flashMode,
      pictureFile: pictureFile ?? this.pictureFile,
      cameras: cameras ?? this.cameras,
      selectedCameraIndex: selectedCameraIndex ?? this.selectedCameraIndex,
      cameraMode: cameraMode ?? this.cameraMode,
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
    try {
      final pictureFile = await state.cameraController!.takePicture();
      state = state.copyWith(pictureFile: pictureFile);
      return pictureFile;
    } catch (e) {
      print(e);
    }
    return null;
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
