import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark65 extends WaterMarkWidget {
  Watermark65({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            jindu: true,
            weidu: true,
            beizhuText: true,
            position: true,
            shijianyanzhengText: true,
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
                    "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "clock"),
                  ),
                ),
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.week.text}",
                    style: Style.watermarkSmallWhite,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Visibility(
                    visible: watermarkUIObject.jindu?.visible ?? false,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.map,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text(
                            "${watermarkUIObject.jindu?.text} ${watermarkUIObject.weidu?.text}",
                            style: Style.watermarkSmallWhite),
                      ],
                    )),
                Visibility(
                  visible: watermarkUIObject.location?.visible ?? false,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text("${watermarkUIObject.location?.text}",
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
                      Text("${watermarkUIObject.beizhuText?.text}",
                          style: Style.watermarkSmallWhite),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                      watermarkUIObject.shijianyanzhengText?.visible ?? false,
                  child: Text(
                      "${watermarkUIObject.shijianyanzhengText?.text ?? ""}",
                      style: Style.watermarkSmallWhite),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Watermark65 defaultData() {
    return Watermark65(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
