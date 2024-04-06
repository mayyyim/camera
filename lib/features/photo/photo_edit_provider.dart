import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:cameraApp/model/watermark/watermark_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class PhotoState {
  final WatermarkItem? watermarkItem;
  final String file;
  final String text;
  final Offset textPosition;
  final GlobalKey key;
  final bool isBorderRadius;

  PhotoState({
    required this.file,
    required this.watermarkItem,
    this.text = '',
    this.textPosition = Offset.zero,
    required this.key,
    this.isBorderRadius = false,
  });

  PhotoState copyWith({
    WatermarkItem? watermarkItem,
    String? file,
    String? text,
    Offset? textPosition,
    bool? isBorderRadius,
  }) {
    return PhotoState(
      file: file ?? this.file,
      watermarkItem: watermarkItem ?? this.watermarkItem,
      text: text ?? this.text,
      textPosition: textPosition ?? this.textPosition,
      key: this.key,
      isBorderRadius: isBorderRadius ?? this.isBorderRadius,
    );
  }
}

class PhotoEditorState {
  List<PhotoState> photos;
  int currentIndex;

  PhotoEditorState({required this.photos, this.currentIndex = 0});

  PhotoState get currentPhoto => photos[currentIndex];
}

// 照片编辑器的状态管理器
class PhotoEditorNotifier extends StateNotifier<PhotoEditorState> {
  PhotoEditorNotifier() : super(PhotoEditorState(photos: []));

  // 添加照片
  void addPhoto(String file) {
    state.photos
        .add(PhotoState(file: file, watermarkItem: null, key: GlobalKey()));
  }

  // 删除照片
  void removePhoto(int index) {
    state.photos.removeAt(index);
  }

  // 切换当前编辑的照片
  void setCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  // update current file
  void updateCurrentFile(String file) {
    List<PhotoState> photos = state.photos;
    PhotoState newPhoto = state.currentPhoto.copyWith(file: file);
    photos.replaceRange(state.currentIndex, state.currentIndex + 1, [newPhoto]);
    state = state.copyWith(photos: photos);
  }

  void updateCurrentBorder() {
    List<PhotoState> photos = state.photos;
    bool isBorderRadius = state.currentPhoto.isBorderRadius;
    PhotoState newPhoto =
        state.currentPhoto.copyWith(isBorderRadius: !isBorderRadius);
    photos.replaceRange(state.currentIndex, state.currentIndex + 1, [newPhoto]);
    state = state.copyWith(photos: photos);
  }

  void updateCurrentFileText(String text) {
    List<PhotoState> photos = state.photos;
    PhotoState newPhoto = state.currentPhoto.copyWith(text: text);
    photos.replaceRange(state.currentIndex, state.currentIndex + 1, [newPhoto]);
    state = state.copyWith(photos: photos);
  }

  void updateCurrentFileTextPosition(Offset textPosition) {
    List<PhotoState> photos = state.photos;
    PhotoState newPhoto =
        state.currentPhoto.copyWith(textPosition: textPosition);
    photos.replaceRange(state.currentIndex, state.currentIndex + 1, [newPhoto]);
    state = state.copyWith(photos: photos);
  }

  // 添加水印
  void updateWatermark(int photoIndex, WatermarkItem watermarkItem) {
    /// TODO
    state = state.copyWith(photos: List.from(state.photos));
  }

  // 移除水印
  void removeWatermark(int photoIndex) {
    /// TODO
    state = state.copyWith(photos: List.from(state.photos));
  }

  Future<void> setPhotos(List<XFile> xFiles) async {
    List<PhotoState> photoStates = [];
    for (var element in xFiles) {
      PhotoState photoState =
          PhotoState(file: element.path, watermarkItem: null, key: GlobalKey());
      photoStates.add(photoState);
    }
    state = state.copyWith(photos: photoStates);
  }

  Future<void> clear() async {
    state = state.copyWith(photos: null, currentIndex: 0);
  }

  Future<List<File>> convertAndSaveImages(List<XFile> imageFiles) async {
    List<File> highQualityImageFiles = [];
    for (XFile xFile in imageFiles) {
      File originalFile = File(xFile.path);
      List<int> bytes = await originalFile.readAsBytes();
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String fileName =
          DateTime.now().millisecondsSinceEpoch.toString() + '.png';
      String filePath = '${appDocDir.path}/$fileName';
      File newFile = File(filePath);
      await newFile.writeAsBytes(bytes, flush: true); // 直接将原始字节写入新文件，不进行任何修改
      highQualityImageFiles.add(newFile);
    }
    return highQualityImageFiles;
  }
}

// 扩展PhotoEditorState以添加copyWith方法
extension on PhotoEditorState {
  PhotoEditorState copyWith({
    List<PhotoState>? photos,
    int? currentIndex,
  }) {
    return PhotoEditorState(
      photos: photos ?? this.photos,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

// 定义照片编辑器的provider
final photoEditorProvider =
    StateNotifierProvider<PhotoEditorNotifier, PhotoEditorState>((ref) {
  return PhotoEditorNotifier();
});
