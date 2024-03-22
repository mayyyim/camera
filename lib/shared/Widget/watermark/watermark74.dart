import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark74 extends WaterMarkWidget {
  const Watermark74({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                "会议记录",
                style: Style.watermarkMediumBlack,
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black54,
            ),
            Visibility(
              visible: watermarkUIObject.day.visible,
              child: Row(
                children: [
                  Text(
                    " ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: Style.watermarkLargemBlack,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                    style: Style.watermarkSmallBlack,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black54,
            ),
            Visibility(
              visible: watermarkUIObject.zhuchirenText.visible,
              child: Text("主持人: ${watermarkUIObject.zhuchirenText.text}",
                  style: Style.watermarkSmallBlack),
            ),
            Visibility(
              visible: watermarkUIObject.location.visible,
              child: Text("地点: ${watermarkUIObject.location.text}",
                  style: Style.watermarkSmallBlack),
            ),
            Visibility(
              visible: watermarkUIObject.beizhuText.visible,
              child: Text("备注: ${watermarkUIObject.beizhuText.text}",
                  style: Style.watermarkSmallBlack),
            ),
          ]),
    );
  }

  static Watermark74 defaultData() {
    return Watermark74(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
