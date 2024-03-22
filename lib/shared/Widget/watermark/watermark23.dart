import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark23 extends WaterMarkWidget {
  const Watermark23({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5))), 
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 300,
              padding: EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Text(
                "工程记录",
                style: Style.watermarkMediumWhite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}  ${watermarkUIObject.week.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: Style.watermarkSmallWhite,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.location.visible,
                    child: Text("工程地点: ${watermarkUIObject.location.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark23 defaultData() {
    return Watermark23(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
