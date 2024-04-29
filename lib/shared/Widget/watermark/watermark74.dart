import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark74 extends WaterMarkWidget {
  Watermark74({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            beizhuText: true,
            suduText: true,
            position: true,
            zhuchirenText: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Color(0xFFE7ECF2),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              height: 1,
              width: 100,
              decoration: BoxDecoration(color: Colors.black),
            ),
            Visibility(
              visible: watermarkUIObject.day.visible,
              child: Row(
                children: [
                  Text(
                    " ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "clock"),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              height: 1,
              width: 100,
              decoration: BoxDecoration(color: Colors.black),
            ),
            Visibility(
              visible: watermarkUIObject.zhuchirenText?.visible ?? false,
              child: Text("主持人: ${watermarkUIObject.zhuchirenText?.text}",
                  style: Style.watermarkSmallBlack),
            ),
            Visibility(
              visible: watermarkUIObject.location?.visible ?? false,
              child: Text("地点: ${watermarkUIObject.location?.text}",
                  style: Style.watermarkSmallBlack),
            ),
            Visibility(
              visible: watermarkUIObject.beizhuText?.visible ?? false,
              child: Text("备注: ${watermarkUIObject.beizhuText?.text ?? ""}",
                  style: Style.watermarkSmallBlack),
            ),
            Visibility(
              visible: watermarkUIObject.suduText?.visible ?? false,
              child: Text("速度: ${watermarkUIObject.suduText?.text ?? ""}",
                  style: Style.watermarkSmallBlack),
            ),
          ]),
    );
  }

  static Watermark74 defaultData() {
    return Watermark74(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
