import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark12 extends WaterMarkWidget {
  Watermark12({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
              dateTime: true,
              weather: true,
              jindu: true,
              weidu: true,
              beizhuText: true,
              position: true,
              xunjianrenText: true,
              xunjianleixingText: true),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
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
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Text(
                "物业巡检水印",
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
                      "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.week.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: Style.watermarkMediumWhite,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.location?.visible ?? false,
                    child: Text("巡检地址: ${watermarkUIObject.location?.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                  Visibility(
                    visible:
                        watermarkUIObject.xunjianleixingText?.visible ?? false,
                    child: Text(
                        "巡检类型: ${watermarkUIObject.xunjianleixingText?.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                  Visibility(
                    visible: watermarkUIObject.xunjianrenText?.visible ?? false,
                    child: Text(
                        "巡检人: ${watermarkUIObject.xunjianrenText?.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                  Visibility(
                    visible: watermarkUIObject.beizhuText?.visible ?? false,
                    child: Text("备注: ${watermarkUIObject.beizhuText?.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark12 defaultData() {
    return Watermark12(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
