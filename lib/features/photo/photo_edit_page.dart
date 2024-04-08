import 'dart:io';

import 'package:cameraApp/features/photo/photo_edit_provider.dart';
import 'package:cameraApp/features/watermark/watermark_edit_sheet.dart';
import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/features/watermark/watermark_select_sheet.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/utils/image_loader_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

import 'package:video_player/video_player.dart';

class PhotoEditPage extends ConsumerStatefulWidget {
  final bool isPhoto;

  const PhotoEditPage({super.key, this.isPhoto = true});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return PhotoEditPageState();
  }
}

class PhotoEditPageState extends ConsumerState<PhotoEditPage> {
  final _textEditingController = TextEditingController();
  Offset _textPosition = Offset.zero;
  late Offset _watermarkPosition;
  bool _isDragging = false;
  bool _isDraggingWatermark = false;
  bool _isScalingWatermark = false;
  FocusNode focusNode = FocusNode();
  late VideoPlayerController _controller;
  late GlobalKey _watermarkKey;

  @override
  void initState() {
    super.initState();
    _watermarkPosition =
        ref.read(photoEditorProvider).photos[0].watermarkPosition;
    _textEditingController.addListener(_textChanged);
    if (!widget.isPhoto) {
      File file = File(ref.read(photoEditorProvider).photos.first.file);
      _controller = VideoPlayerController.file(file)
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {
            _controller.play();
            _controller.setLooping(true);
          });
        });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    focusNode.dispose();
    if (!widget.isPhoto) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _textChanged() {
    if (!mounted) return;
    setState(() {
      print("MJ: test text changes");
      ref
          .read(photoEditorProvider.notifier)
          .updateCurrentFileText(_textEditingController.value.text);
      print(
          "MJ: test text changes  ${ref.read(photoEditorProvider).photos.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    _watermarkKey = GlobalKey(
        debugLabel:
            ref.read(photoEditorProvider).photos.first.watermarkItem?.id);

    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F8),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Column(
            children: <Widget>[
              BasicHeader(
                text: widget.isPhoto ? "图片编辑" : "视频保存",
                widget: Image.asset(
                  "assets/icon/baocun.png",
                  width: 60,
                ),
                onBackTap: () {
                  context.pop();
                  ref.read(photoEditorProvider.notifier).clear();
                },
                onWidgetTap: () {
                  List<GlobalKey> keyList = [];
                  ref.read(photoEditorProvider).photos.forEach((element) {
                    keyList.add(element.key);
                  });
                  if (widget.isPhoto) {
                    saveImg(keyList);
                  } else {
                    _addWatermarkToVideo(
                        ref.read(photoEditorProvider).photos.first.file);
                  }
                },
              ),
              buildPageView(),
              const SizedBox(
                height: 10,
              ),
              widget.isPhoto ? editWidget() : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget editWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // 选择图片按钮
            _buildIconWithLabel(
                Image.asset(
                  "assets/icon/shuiyin.png",
                  width: 20,
                  height: 20,
                ),
                '水印', () async {
              print("MJ: test click shuiyin");
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const WatermarkSelectorSheet());
            }),
            _buildIconWithLabel(
                Image.asset(
                  "assets/icon/youxiajiao.png",
                  width: 20,
                  height: 20,
                ),
                '右下角', () async {
              print(
                  "MJ: test 右下角 ${ref.read(photoEditorProvider).currentPhoto.isBorderRadius}");
              ref.read(photoEditorProvider.notifier).updateCurrentBorder();
            }),
            _buildIconWithLabel(
                Image.asset(
                  "assets/icon/wenben.png",
                  width: 20,
                  height: 20,
                ),
                '文字', () {
              print("MJ: test wenben");
              focusNode.requestFocus();
            }),
            _buildIconWithLabel(
                Image.asset(
                  "assets/icon/caijian.png",
                  width: 20,
                  height: 20,
                ),
                '裁剪', () async {
              print("MJ: test caijian");
              await _cropImage();
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _addWatermarkToVideo(inputFilePath) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String _outputVideoPath = '$tempPath/output_video.mp4';
    ui.Image image =
        await ImageLoaderUtils.imageLoader.getImageFromWidget(_watermarkKey);
    String watermarkImagePath =
        await ImageLoaderUtils.imageLoader.saveImageToCache(image);

    String ffmpegCommand =
        '-i $inputFilePath -i $watermarkImagePath -filter_complex overlay=0:H-h-10 $_outputVideoPath';
    await FFmpegKit.execute(ffmpegCommand);
    await saveVideoToGallery(_outputVideoPath);
    showAlert();
  }

  void showAlert() async {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('保存成功'),
      ),
    );

    // 延迟三秒后关闭弹窗
    await Future.delayed(const Duration(seconds: 3));
    // 关闭弹窗
    Navigator.of(context).pop();
  }

  Future<void> saveVideoToGallery(String videoPath) async {
    File videoFile = File(videoPath);
    await ImageGallerySaver.saveFile(videoFile.path);
  }

  Widget watermarkWidget() {
    WaterMarkWidget waterMarkWidget =
        ref.watch(watermarkEditProvider).currentWatermark.toWatermarkWidget();
    double scale = ref.watch(photoEditorProvider).currentPhoto.watermarkScale;

    return GestureDetector(
      // 缩放手势
      // onScaleStart: (details) {
      //   setState(() {
      //     _isScalingWatermark = true;
      //   });
      // },
      // onScaleUpdate: (details) {
      //   if (_isScalingWatermark) {
      //     setState(() {
      //       double newScale = details.scale;
      //       // 限制缩放范围
      //       newScale = newScale.clamp(0.5, 2.0);
      //       // 更新水印大小
      //       ref
      //           .read(photoEditorProvider.notifier)
      //           .updateCurrentFileWatermarkScale(newScale);
      //     });
      //   }
      // },
      // onScaleEnd: (details) {
      //   setState(() {
      //     _isScalingWatermark = false;
      //   });
      // },
      // 拖动手势
      onPanStart: (details) {
        setState(() {
          _isDraggingWatermark = true;
        });
      },
      onPanUpdate: (details) {
        if (_isDraggingWatermark) {
          setState(() {
            // 更新水印位置
            _watermarkPosition += details.delta;
            ref
                .read(photoEditorProvider.notifier)
                .updateCurrentFileWatermarkPosition(_watermarkPosition);
          });
        }
      },
      onPanEnd: (details) {
        setState(() {
          _isDraggingWatermark = false;
        });
      },
      child: Transform.scale(
        scale: scale,
        child: RepaintBoundary(
          key: _watermarkKey,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => WatermarkEditBottomSheet(
                    waterMarkWidget.watermarkVisibleMap),
              );
            },
            child: waterMarkWidget ?? Container(),
          ),
        ),
      ),
    );
  }

  Widget textWidget() {
    return GestureDetector(
      onPanUpdate: (details) {
        if (_isDragging) {
          setState(() {
            _textPosition += details.delta;
            ref
                .read(photoEditorProvider.notifier)
                .updateCurrentFileTextPosition(_textPosition);
          });
        }
      },
      onPanStart: (details) {
        setState(() {
          _isDragging = true;
        });
      },
      onPanEnd: (details) {
        setState(() {
          _isDragging = false;
        });
      },
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            focusNode: focusNode,
            controller: _textEditingController,
            decoration: focusNode.hasFocus
                ? const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  )
                : null,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              // 其他样式设置...
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  Widget buildPageView() {
    print("MJ: test build page view");
    return SizedBox(
      height: MediaQuery.of(context).size.height - 180,
      child: PageView.builder(
        itemCount: ref.read(photoEditorProvider).photos.length,
        itemBuilder: (context, index) {
          Offset textOffset =
              ref.read(photoEditorProvider).photos[index].textPosition;
          Offset watermarkOffset =
              ref.read(photoEditorProvider).photos[index].watermarkPosition;
          return SizedBox(
            height: MediaQuery.of(context).size.height - 230,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RepaintBoundary(
                  key: ref.read(photoEditorProvider).photos[index].key,
                  child: Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias, // 使用Clip.antiAlias来支持圆角
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            ref
                                    .read(photoEditorProvider)
                                    .photos[index]
                                    .isBorderRadius
                                ? const Radius.circular(
                                    10) // 如果isBorderRadius为true，则应用30的圆角半径
                                : const Radius.circular(0), // 否则不应用圆角
                          ),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          // 使用ClipRRect来裁剪子组件以匹配圆角
                          borderRadius: BorderRadius.all(
                            ref
                                    .read(photoEditorProvider)
                                    .photos[index]
                                    .isBorderRadius
                                ? const Radius.circular(10) // 同上
                                : const Radius.circular(0), // 同上
                          ),
                          child: widget.isPhoto
                              ? Image.file(
                                  File(ref
                                      .read(photoEditorProvider)
                                      .photos[index]
                                      .file),
                                  fit: BoxFit.contain,
                                  height:
                                      MediaQuery.of(context).size.height - 230,
                                )
                              : AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),
                                ),
                        ),
                      ),
                      Positioned(
                        left: textOffset.dx,
                        top: textOffset.dy,
                        child: textWidget(),
                      ),
                      Positioned(
                        left: watermarkOffset.dx,
                        top: watermarkOffset.dy,
                        child: watermarkWidget(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${ref.read(photoEditorProvider).currentIndex + 1} / ${ref.read(photoEditorProvider).photos.length}',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        onPageChanged: (page) {
          setState(() {
            ref.read(photoEditorProvider.notifier).setCurrentIndex(page);
            ref.read(watermarkEditProvider.notifier).setCurrentIndex(page);
          });
        },
      ),
    );
  }

  Future<void> _cropImage() async {
    PhotoState photoState = ref.read(photoEditorProvider).currentPhoto;
    String imageFile = photoState.file;
    CroppedFile? croppedFile;
    try {
      croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.blue,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: "裁剪",
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );
      setState(() {
        ref
            .read(photoEditorProvider.notifier)
            .updateCurrentFile(croppedFile!.path);
      });
      debugPrint('upload file path ${croppedFile!.path}');
    } catch (e) {
      debugPrint('crop image error: $e');
    }
  }

  Widget _buildIconWithLabel(
      Widget widget, String label, Function() onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: widget,
        ),
        Text(label, style: const TextStyle(fontSize: 12)), // 根据您的设计调整样式
      ],
    );
  }

  Future<void> saveImg(List<GlobalKey> keyList) async {
    for (var element in keyList) {
      ui.Image image =
          await ImageLoaderUtils.imageLoader.getImageFromWidget(element);
      await ImageLoaderUtils.imageLoader.saveImageToGallery(image);
    }
    showAlert();
  }
}

class ImagePainter extends CustomPainter {
  final File image;
  final Paint _imagePaint = Paint();

  ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO

    // final image = decodeImage(File(image.path).readAsBytesSync());
    // canvas.drawImage(image, Offset.zero, _imagePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
