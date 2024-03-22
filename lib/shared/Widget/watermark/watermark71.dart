import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark71 extends WaterMarkWidget {
  const Watermark71({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent,
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
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.health_and_safety_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(
                        "科学防疫·齐心协力",
                        style: Style.watermarkMediumWhite,
                      ),
                    ],
                  ),
                  Text(
                    "健康监测",
                    style: Style.watermarkLargeWhite,
                  ),
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.week.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: Style.watermarkSmallWhite,
                    ),
                  ),
                ],
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
                    visible: watermarkUIObject.weather.visible,
                    child: Text("天气: ${watermarkUIObject.weather.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                  Visibility(
                    visible: watermarkUIObject.location.visible,
                    child: Text("地点: ${watermarkUIObject.location.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark71 defaultData() {
    return Watermark71(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
