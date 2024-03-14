import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

/// 图片加载工具类
class ImageLoaderUtils {
  //私有化构造
  ImageLoaderUtils._();

  //单例模式创建
  static final ImageLoaderUtils imageLoader = ImageLoaderUtils._();

  Future<ui.Image> getImageFromWidget(GlobalKey globalKey) async {
    RenderRepaintBoundary? boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    double pixelRatio = 2.0; // 增加像素密度
    ui.Image img = await boundary!.toImage(pixelRatio: pixelRatio);
    return img;
  }

  Future<void> saveImageToGallery(ui.Image image) async {
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png)); // 使用原始格式
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print("SaveToAlbumUtil result:${result}");
      return result;
    } else {
      throw StateError("saveLocalImage error imagePath");
    }
  }

  Future<String> saveImageByUIImage(ui.Image image,
      {String? picName,
      String endFormat = "png",
      bool isReplace = true,
      bool isEncode = true}) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    ///拼接目录
    if (picName == null || picName.trim().length == 0) {
      ///当用户没有指定picName时，取当前的时间命名
      picName = "${DateTime.now().millisecond.toString()}.$endFormat";
    } else {
      picName = "$picName.$endFormat";
    }

    if (isEncode) {
      ///对保存的图片名字加密
      picName = md5.convert(utf8.encode(picName)).toString();
    }

    appDocPath = "$appDocPath/$picName";

    ///校验图片是否存在
    var file = File(appDocPath);
    bool exist = await file.exists();
    if (exist) {
      if (isReplace) {
        ///如果图片存在就进行删除替换
        ///如果新的图片加载失败，那么旧的图片也被删除了
        await file.delete();
      } else {
        ///如果图片存在就不进行下载
        return "";
      }
    }
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    print("保存的图片路径 $appDocPath");

    ///将Uint8List的数据格式保存
    await File(appDocPath).writeAsBytes(pngBytes);

    return appDocPath;
  }
}
