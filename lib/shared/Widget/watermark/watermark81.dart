import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark81 extends WaterMarkWidget {
  const Watermark81({required WatermarkUIObject watermarkUIObject})
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
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.south_america,
                    color: Colors.indigo,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Visibility(
                      visible: watermarkUIObject.jindu.visible,
                      child: Text(
                          "${watermarkUIObject.jindu.text} ${watermarkUIObject.weidu.text}",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 10,
                              fontWeight: FontWeight.w500))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: Style.watermarkLargeWhite,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  VerticalStick(
                    color: Colors.indigo,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: watermarkUIObject.day.visible,
                        child: Text(
                          "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                          style: Style.watermarkSmallWhite,
                        ),
                      ),
                      Visibility(
                        visible: watermarkUIObject.day.visible,
                        child: Text(
                          "${watermarkUIObject.week.text}",
                          style: Style.watermarkSmallWhite,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: watermarkUIObject.location.visible,
                    child: Text("${watermarkUIObject.location.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark81 defaultData() {
    return Watermark81(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
