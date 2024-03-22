import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark3 extends WaterMarkWidget {
  const Watermark3({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Visibility(
                visible: watermarkUIObject.jindu.visible,
                child: Text("经度: ${watermarkUIObject.jindu.text}",
                    style: Style.watermarkSmallBlack)),
            Visibility(
                visible: watermarkUIObject.weidu.visible,
                child: Text("纬度: ${watermarkUIObject.weidu.text}",
                    style: Style.watermarkSmallBlack)),
            Visibility(
              visible: watermarkUIObject.location.visible,
              child: Text("地址: ${watermarkUIObject.location.text}",
                  style: Style.watermarkSmallBlack),
            ),
            Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                    "时间: ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: Style.watermarkSmallBlack)),
            Visibility(
              visible: watermarkUIObject.weather.visible,
              child: Text("天气: ${watermarkUIObject.weather.text}",
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

  static Watermark3 defaultData() {
    return Watermark3(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
