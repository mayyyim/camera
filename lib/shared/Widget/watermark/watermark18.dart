import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark18 extends WaterMarkWidget {
  const Watermark18({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(25),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Visibility(
              visible: watermarkUIObject.day.visible,
              child: Text(
                "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ",
                style: Style.watermarkMediumBlack,
              ),
            ),
            Visibility(
              visible: watermarkUIObject.day.visible,
              child: Text(
                " ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text} ",
                style: Style.watermarkLargemBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Watermark18 defaultData() {
    return Watermark18(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
