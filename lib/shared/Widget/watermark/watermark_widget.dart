import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:flutter/cupertino.dart';

abstract class WaterMarkWidget extends StatelessWidget {
  final WatermarkUIObject watermarkUIObject;
  final WatermarkVisibleMap watermarkVisibleMap;

  const WaterMarkWidget({
    super.key,
    required this.watermarkUIObject,
    required this.watermarkVisibleMap,
  });
}
