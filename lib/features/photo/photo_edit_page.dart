import 'dart:io';

import 'package:cameraApp/features/photo/photo_edit_provider.dart';
import 'package:cameraApp/features/watermark/watermark_edit_sheet.dart';
import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:cameraApp/utils/image_loader_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:ui' as ui;

class PhotoEditPage extends ConsumerStatefulWidget {
  const PhotoEditPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return PhotoEditPageState();
  }
}

class PhotoEditPageState extends ConsumerState<PhotoEditPage> {
  final _textEditingController = TextEditingController();
  Offset _textPosition = Offset.zero;
  bool _isDragging = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_textChanged);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    focusNode.dispose();
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
                text: "图片编辑",
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
                  print("MJ: test baocun");
                  saveImg(keyList);
                },
              ),
              buildPageView(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
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
                        /// TODO
                        print("MJ: test shuiyin");
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
                        ref
                            .read(photoEditorProvider.notifier)
                            .updateCurrentBorder();
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveImage() {
    // 这里应该添加保存图片的逻辑
  }

  Widget watermarkWidget() {
    print(
        "MJ: water mark widget rebuild ${ref.read(watermarkEditProvider).currentWatermark.watermarkUIObject.day.visible}");
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => const WatermarkEditBottomSheet(),
        );
      },
      child: ref
              .read(watermarkEditProvider)
              .currentWatermark
              .toWatermarkWidget() ??
          Container(),
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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 180,
      child: PageView.builder(
        itemCount: ref.read(photoEditorProvider).photos.length,
        itemBuilder: (context, index) {
          Offset textOffset =
              ref.read(photoEditorProvider).photos[index].textPosition;
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
                          child: Image.file(
                            File(ref
                                .read(photoEditorProvider)
                                .photos[index]
                                .file),
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height - 230,
                          ),
                        ),
                      ),
                      Positioned(
                        left: textOffset.dx,
                        top: textOffset.dy,
                        child: textWidget(),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 0,
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
    print("MJ: baocun chenggongg");
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
