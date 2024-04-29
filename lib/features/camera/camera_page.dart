import 'dart:async';

import 'package:camera/camera.dart';
import 'package:cameraApp/features/camera/camera_provider.dart';
import 'package:cameraApp/features/photo/photo_edit_provider.dart';
import 'package:cameraApp/features/watermark/watermark_edit_sheet.dart';
import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/features/watermark/watermark_select_sheet.dart';
import 'package:cameraApp/shared/Widget/camera_model_option.dart';
import 'package:cameraApp/shared/Widget/countdown_dialog.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CameraPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return CameraPageState();
  }
}

class CameraPageState extends ConsumerState<CameraPage> {
  bool _isDraggingWatermark = false;
  Offset _watermarkPosition = const Offset(20.0, 20.0);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      ref
          .read(watermarkEditProvider.notifier)
          .initWatermark(length: 1, watermarkOffset: Offset(20.0, 80.0));
      _watermarkPosition =
          ref.watch(watermarkEditProvider).currentWatermark.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraProvider);
    bool showWatermark = ref.watch(watermarkEditProvider).showWatermark;
    // 设备尺寸
    final Size size = MediaQuery.of(context).size;
    // 设备像素比
    final double deviceRatio = size.width / (size.height);
    // 相机纵横比
    final double aspectRatio = cameraState.cameraController!.value.aspectRatio;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopToolbar(ref),
            Container(
              height: MediaQuery.of(context).size.height - 282,
              decoration: const BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  SizedBox(
                    /// TODO
                    /// bili
                    height: MediaQuery.of(context).size.height - 282,
                    child: cameraState.isInitialized
                        ? Transform.scale(
                            scale: 1,
                            child: AspectRatio(
                                aspectRatio: aspectRatio,
                                child: CameraPreview(
                                    cameraState.cameraController!)),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                  if (showWatermark)
                    Positioned(
                        left: _watermarkPosition.dx,
                        top: _watermarkPosition.dy,
                        child: watermarkWidget()),
                ],
              ),
            ),
            _buildBottomToolbar(ref),
          ],
        ),
      ),
    );
  }

  Widget _buildTopToolbar(WidgetRef ref) {
    CameraState state = ref.watch(cameraProvider);
    IconData iconData;
    switch (state.flashMode) {
      case FlashMode.always:
        iconData = Icons.flash_on;
        break;
      case FlashMode.off:
        iconData = Icons.flash_off;
        break;
      case FlashMode.auto:
        iconData = Icons.flash_auto;
        break;
      case FlashMode.torch:
        iconData = Icons.flashlight_on;
        break;
    }
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 用来切换闪光灯状态的UI按钮
              IconButton(
                icon: Icon(
                  iconData,
                  color: Colors.black,
                ),
                onPressed: () {
                  // 获取下一个闪光灯状态
                  FlashMode nextMode;
                  switch (state.flashMode) {
                    case FlashMode.auto:
                      nextMode = FlashMode.off;
                      break;
                    case FlashMode.off:
                      nextMode = FlashMode.torch;
                      break;
                    case FlashMode.torch:
                      nextMode = FlashMode.auto;
                      break;
                    default:
                      nextMode = FlashMode.auto;
                      break;
                  }
                  ref.read(cameraProvider.notifier).setFlashMode(nextMode);
                },
              ),

              // 顶部工具栏的设置图标
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.black),
                onPressed: () {
                  context.push("/setting");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomToolbar(WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconWithLabel(
                    Image.asset(
                      "assets/icon/photos.png",
                      width: 20,
                      height: 20,
                    ),
                    '相册', () async {
                  List<XFile> imageFiles =
                      await ref.read(cameraProvider.notifier).pickPhotos(ref);
                  ref.read(photoEditorProvider.notifier).setPhotos(imageFiles);
                  if (imageFiles.isNotEmpty) {
                    await ref
                        .read(watermarkEditProvider.notifier)
                        .initWatermark(
                            length: imageFiles.length,
                            watermarkOffset: _watermarkPosition);
                    // ignore: use_build_context_synchronously
                    context.push('/photo/edit/true');
                  }
                }),
                _buildIconWithLabel(
                    Image.asset(
                      "assets/icon/fanzhuan.png",
                      width: 20,
                      height: 20,
                    ),
                    '翻转', () async {
                  await ref.read(cameraProvider.notifier).flipCamera();
                }),
                _buildCaptureButton(ref),
                _buildIconWithLabel(
                    Image.asset(
                      "assets/icon/shuiyin.png",
                      width: 20,
                      height: 20,
                    ),
                    '水印', () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => const WatermarkSelectorSheet());
                }),
                _buildIconWithLabel(const Icon(Icons.person), '个人', () {
                  context.push('/user');
                }),
              ],
            ),
            const SizedBox(height: 40),
            const CameraModeSwitch(), // 根据您的设计调整样式
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(
      Widget widget, String label, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget,
          Text(label, style: const TextStyle(fontSize: 12)), // 根据您的设计调整样式
        ],
      ),
    );
  }

  Widget _buildCaptureButton(WidgetRef ref) {
    bool isRecording = ref.watch(cameraProvider).isRecording;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (ref.watch(cameraProvider).cameraMode == CameraMode.photo)
            ? Colors.blue
            : (isRecording ? Colors.red : Colors.blue), // 根据您的设计调整颜色
      ),
      child: IconButton(
        iconSize: 48, // 根据您的设计调整大小
        icon: Icon(
            (ref.read(cameraProvider).cameraMode == CameraMode.photo)
                ? Icons.camera_alt
                : Icons.video_camera_front,
            color: Colors.white), // 根据您的设计调整颜色
        onPressed: () async {
          if (ref.read(cameraProvider).delayInSecond > 0) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // Show the CountdownDialog
                return CountdownDialog(
                  counter: ref
                      .read(cameraProvider)
                      .delayInSecond, // Set your desired countdown duration
                );
              },
            );
          }
          Timer(Duration(seconds: ref.read(cameraProvider).delayInSecond),
              () async {
            if (ref.read(cameraProvider).cameraMode == CameraMode.photo) {
              XFile? file =
                  await ref.read(cameraProvider.notifier).takePicture();
              print("MJ: test file is $file");
              if (file != null) {
                ref.read(photoEditorProvider.notifier).setPhotos([file]);
                ref
                    .read(photoEditorProvider.notifier)
                    .updateCurrentFileWatermarkPosition(_watermarkPosition);
                context.push('/photo/edit/true');
              }
            } else {
              XFile? file =
                  await ref.read(cameraProvider.notifier).toggleRecording();
              if (file != null) {
                ref.read(photoEditorProvider.notifier).setPhotos([file]);
                ref
                    .read(photoEditorProvider.notifier)
                    .updateCurrentFileWatermarkPosition(_watermarkPosition);
                context.push('/photo/edit/false');
              }
            }
          });
        },
      ),
    );
  }

  Widget watermarkWidget() {
    if (ref.read(watermarkEditProvider).watermarks != null &&
        ref.read(watermarkEditProvider).watermarks.length > 0) {
      WaterMarkWidget waterMarkWidget =
          ref.watch(watermarkEditProvider).currentWatermark.toWatermarkWidget();
      return GestureDetector(
        onPanUpdate: (details) {
          if (_isDraggingWatermark) {
            setState(() {
              _watermarkPosition += details.delta;
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateCurrentFileWatermarkPosition(_watermarkPosition);
            });
          }
        },
        onPanStart: (details) {
          setState(() {
            _isDraggingWatermark = true;
          });
        },
        onPanEnd: (details) {
          setState(() {
            _isDraggingWatermark = false;
          });
        },
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) =>
                WatermarkEditBottomSheet(waterMarkWidget.watermarkVisibleMap),
          );
        },
        child: Container(
          child: waterMarkWidget ?? Container(),
        ),
      );
    } else {
      return Container();
    }
  }
}
