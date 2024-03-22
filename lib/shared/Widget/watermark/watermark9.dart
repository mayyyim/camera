import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark9 extends WaterMarkWidget {
  const Watermark9({required WatermarkUIObject watermarkUIObject})
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
            Visibility(
              visible: watermarkUIObject.hour.visible,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    padding: const EdgeInsets.all(2),
                    child: Text(watermarkUIObject.hour.text,
                        style: Style.watermarkMediumWhite),
                  ),
                  Text(" : ", style: Style.watermarkMediumWhite),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    padding: const EdgeInsets.all(2),
                    child: Text(watermarkUIObject.hour.text,
                        style: Style.watermarkMediumWhite),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}  ${watermarkUIObject.week.text}",
                    style: Style.watermarkMediumWhite,
                  ),
                ),
                Visibility(
                    visible: watermarkUIObject.location.visible,
                    child: const Divider(
                      color: Colors.yellow,
                      thickness: 2,
                    )),
                Visibility(
                  visible: watermarkUIObject.location.visible,
                  child: Text(" ${watermarkUIObject.location.text}",
                      style: Style.watermarkSmallWhite),
                ),
              ],
            )
          ]),
    );
  }

  static Watermark9 defaultData() {
    return Watermark9(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
