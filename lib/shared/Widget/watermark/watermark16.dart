import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark16 extends WaterMarkWidget {
  const Watermark16({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
  return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              child: TimeWidget(
                hour: watermarkUIObject.hour,
                minute: watermarkUIObject.minute,
                textSize: 20,
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.week.text}",
                    style: Style.watermarkSmallWhite,
                  ),
                ),
                Visibility(
                  visible: watermarkUIObject.location.visible,
                  child: Text("${watermarkUIObject.location.text}",
                      style: Style.watermarkSmallWhite),
                ),
              ],
            ),
          ]),
    );
  }

  static Watermark16 defaultData() {
    return Watermark16(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
