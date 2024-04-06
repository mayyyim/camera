import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark28 extends WaterMarkWidget {
  Watermark28({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            weather: true,
            jindu: true,
            weidu: true,
            beizhuText: true,
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
              width: 90,
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                color: Color(0xFF005EB7),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Container(
                padding:
                    const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 9),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                child: const Text(
                  "现场拍照",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF005EB7),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Visibility(
                visible: watermarkUIObject.jindu?.visible ?? false,
                child: Text("经度: ${watermarkUIObject.jindu?.text}",
                    style: Style.watermarkSmallWhite)),
            Visibility(
                visible: watermarkUIObject.weidu?.visible ?? false,
                child: Text("纬度: ${watermarkUIObject.weidu?.text}",
                    style: Style.watermarkSmallWhite)),
            Visibility(
              visible: watermarkUIObject.location?.visible ?? false,
              child: Text("地址: ${watermarkUIObject.location?.text}",
                  style: Style.watermarkSmallWhite),
            ),
            Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                    "时间: ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: Style.watermarkSmallWhite)),
            Visibility(
              visible: watermarkUIObject.weather?.visible ?? false,
              child: Text("天气: ${watermarkUIObject.weather?.text ?? ""}",
                  style: Style.watermarkSmallWhite),
            ),
            Visibility(
              visible: watermarkUIObject.beizhuText?.visible ?? false,
              child: Text("备注: ${watermarkUIObject.beizhuText?.text ?? ""}",
                  style: Style.watermarkSmallWhite),
            ),
          ]),
    );
  }

  static Watermark28 defaultData() {
    return Watermark28(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
