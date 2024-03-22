import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark extends WaterMarkWidget {
  const Watermark({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 150, minHeight: 100),
      padding: const EdgeInsets.all(10.0), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TimeWidget(
              hour: watermarkUIObject.hour, minute: watermarkUIObject.minute),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 2,
            width: 140,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  watermarkUIObject.day.text, // 第二行文本
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 5.0), // 再次添加间距
              Visibility(
                visible: watermarkUIObject.week.visible,
                child: Text(
                  watermarkUIObject.week.text,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5.0), // 更大的间距
          Expanded(
            child: Text(
              watermarkUIObject.location != null
                  ? watermarkUIObject.location!.text
                  : "请开启定位服务",
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Watermark defaultData() {
    return Watermark(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
