import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark78 extends WaterMarkWidget {
  Watermark78({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
              dateTime: true,
              beizhuText: true,
              position: true,
              customized: true,
              shijianyanzhengText: true),
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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                    visible: watermarkUIObject.customized?.visible ?? false,
                    child: Row(
                      children: [
                        const Text(
                          "\“ ",
                          style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFFFDC216),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          watermarkUIObject.customized?.text ?? "",
                          style: Style.watermarkLargeWhite,
                        ),
                        const Text(
                          " \”",
                          style: TextStyle(
                              fontSize: 28,
                              color: Color(0xFFFDC216),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
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
                  visible: watermarkUIObject.location?.visible ?? false,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(watermarkUIObject.location?.text ?? "",
                          style: Style.watermarkSmallWhite),
                    ],
                  ),
                ),
                Visibility(
                  visible: watermarkUIObject.beizhuText?.visible ?? false,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.note_alt_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(watermarkUIObject.beizhuText?.text ?? "",
                          style: Style.watermarkSmallWhite),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                      watermarkUIObject.shijianyanzhengText?.visible ?? false,
                  child: Text(watermarkUIObject.shijianyanzhengText?.text ?? "",
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
