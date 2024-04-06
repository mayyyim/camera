import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark26 extends WaterMarkWidget {
  Watermark26({required WatermarkUIObject watermarkUIObject})
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
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Visibility(
                visible: watermarkUIObject.jindu?.visible ?? false,
                child: Text("经度: ${watermarkUIObject.jindu?.text}",
                    style: Style.watermarkMediumWhite)),
            Visibility(
                visible: watermarkUIObject.weidu?.visible ?? false,
                child: Text("纬度: ${watermarkUIObject.weidu?.text}",
                    style: Style.watermarkMediumWhite)),
            Visibility(
              visible: watermarkUIObject.location?.visible ?? false,
              child: Text("地址: ${watermarkUIObject.location?.text}",
                  style: Style.watermarkMediumWhite),
            ),
            Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                    "时间: ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: Style.watermarkMediumWhite)),
            Visibility(
              visible: watermarkUIObject.weather?.visible ?? false,
              child: Text("天气: ${watermarkUIObject.weather?.text ?? ""}",
                  style: Style.watermarkMediumWhite),
            ),
            Visibility(
              visible: watermarkUIObject.beizhuText?.visible ?? false,
              child: Text("备注: ${watermarkUIObject.beizhuText?.text ?? ""}",
                  style: Style.watermarkMediumWhite),
            ),
          ]),
    );
  }

  static Watermark26 defaultData() {
    return Watermark26(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
