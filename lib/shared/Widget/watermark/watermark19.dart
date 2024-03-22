import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark19 extends WaterMarkWidget {
  const Watermark19({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TimeWidget(
                  textSize: 20,
                  hour: watermarkUIObject.hour,
                  minute: watermarkUIObject.minute),
              const Divider(
                height: 2,
                color: Colors.orangeAccent,
              ),
            ],
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
                  ),
                ),
              ),
              const SizedBox(height: 5.0), //
              Visibility(visible: watermarkUIObject.location.visible,
                child: Text(
                  '${watermarkUIObject.location.text}', // 第二行文本
                  style: Style.watermarkMediumWhite
                ),
              )// 再次添加间距
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
