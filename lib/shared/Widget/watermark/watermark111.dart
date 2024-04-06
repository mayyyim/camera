import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark111 extends WaterMarkWidget {
  Watermark111({required WatermarkUIObject watermarkUIObject})
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
                  visible: watermarkUIObject.location?.visible ?? false,
                  child: Text("${watermarkUIObject.location?.text}",
                      style: Style.watermarkSmallWhite),
                ),
              ],
            ),
          ]),
    );
  }

  static Watermark111 defaultData() {
    return Watermark111(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
