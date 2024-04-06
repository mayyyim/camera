import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark16 extends WaterMarkWidget {
  Watermark16({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            weather: true,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
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
                  visible: watermarkUIObject.location?.visible ?? false,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        width: 2,
                      ),
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 13,
                      ),
                      Text("${watermarkUIObject.location?.text}",
                          style: Style.watermarkSmallWhite),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: watermarkUIObject.weather?.visible ?? false,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.sunny,
                    color: Colors.white,
                    size: 13,
                  ),
                  Text("${watermarkUIObject.weather?.text}",
                      style: Style.watermarkSmallWhite),
                ],
              ),
            ),
          ]),
    );
  }

  static Watermark16 defaultData() {
    return Watermark16(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
