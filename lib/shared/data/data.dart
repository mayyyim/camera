import 'dart:io';
import 'package:flutter/cupertino.dart';

class GlobalData {
  static bool _initialized = false;

  static bool get initialized => _initialized;
  static late final bool _isAndroid;

  static bool get isAndroid => _initialized ? _isAndroid : true;

  static Future<void> init() async {
    if (_initialized) {
      print("MJ AyayiData has already initialized");
      return;
    }
    try {
      _isAndroid = await BasicDataGetter.isAndroid();
      _initialized = true;
    } on FlutterError catch (error) {
      print("MJ: AyayiData initialization failed with error: $error");
    }
  }
}

class BasicDataGetter {
  static late final BasicDataGetter _instance =
      BasicDataGetter._privateConstructor();

  BasicDataGetter._privateConstructor() {}

  factory BasicDataGetter() => _instance;

  static Future<bool> isAndroid() async {
    return Platform.isAndroid;
  }
}
