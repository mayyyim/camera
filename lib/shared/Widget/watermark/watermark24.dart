import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark24 extends WaterMarkWidget {
  Watermark24({required WatermarkUIObject watermarkUIObject})
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
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: const [
                Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "现场拍照",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            Visibility(
              visible: watermarkUIObject.day.visible,
              child: Text(
                "时间: ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                style: Style.watermarkSmallWhite,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: watermarkUIObject.location?.visible ?? false,
              child: Text("地点: ${watermarkUIObject.location?.text}",
                  style: Style.watermarkSmallWhite),
            ),
          ]),
    );
  }

  static Watermark24 defaultData() {
    return Watermark24(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
