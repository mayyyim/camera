import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:flutter/cupertino.dart';

abstract class WaterMarkWidget extends StatelessWidget {
  final WatermarkUIObject watermarkUIObject;
  const WaterMarkWidget({super.key, required this.watermarkUIObject});

}