import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark19 extends WaterMarkWidget {
  Watermark19({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            position: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Visibility(
            visible: watermarkUIObject.day.visible,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Visibility(
                  child: Text(
                    "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 2,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  '${watermarkUIObject.month.text}.${watermarkUIObject.day.text}  ${watermarkUIObject.week.text} ', // 第二行文本
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 5.0), //
              Visibility(
                visible: watermarkUIObject.location?.visible ?? false,
                child: Text(
                  '${watermarkUIObject.location?.text}', // 第二行文本
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Archivo"),
                ),
              ) // 再次添加间距
            ],
          ),
        ],
      ),
    );
  }

  static Watermark19 defaultData() {
    return Watermark19(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
