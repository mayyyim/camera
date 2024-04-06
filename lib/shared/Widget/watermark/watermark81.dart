import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark81 extends WaterMarkWidget {
  Watermark81({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            jindu: true,
            weidu: true,
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.south_america,
                    color: Colors.indigo,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Visibility(
                      visible: watermarkUIObject.jindu?.visible ?? false,
                      child: Text(
                          "${watermarkUIObject.jindu?.text} ${watermarkUIObject.weidu?.text}",
                          style: const TextStyle(
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
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const VerticalStick(
                    height: 30,
                    width: 3,
                    color: Colors.indigo,
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
                          "${watermarkUIObject.week.text}",
                          style: Style.watermarkSmallWhite,
                        ),
                      ),
                      Visibility(
                        visible: watermarkUIObject.day.visible,
                        child: Text(
                          "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                          style: Style.watermarkSmallWhite,
                        ),
                      ),
                    ],
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
