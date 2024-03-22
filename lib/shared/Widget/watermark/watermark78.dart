import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark78 extends WaterMarkWidget {
  const Watermark78({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                    visible: watermarkUIObject.customized.visible,
                    child: Text(
                      watermarkUIObject.customized.text,
                      style: Style.watermarkLargeWhite,
                    )),
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text} ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.week.text}",
                    style: Style.watermarkMediumWhite,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Visibility(
                  visible: watermarkUIObject.location.visible,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(watermarkUIObject.location.text,
                          style: Style.watermarkSmallWhite),
                    ],
                  ),
                ),
                Visibility(
                  visible: watermarkUIObject.shijianyanzhengText.visible,
                  child: Text(watermarkUIObject.shijianyanzhengText.text,
                      style: Style.watermarkSmallWhite),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Watermark78 defaultData() {
    return Watermark78(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
