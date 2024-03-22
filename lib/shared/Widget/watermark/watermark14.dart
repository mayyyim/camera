import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark14 extends WaterMarkWidget {
  const Watermark14({required WatermarkUIObject watermarkUIObject})
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
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                      visible: watermarkUIObject.jindu.visible,
                      child: Text("经度: ${watermarkUIObject.jindu.text}",
                          style: Style.watermarkSmallWhite)),
                  Visibility(
                      visible: watermarkUIObject.weidu.visible,
                      child: Text("纬度: ${watermarkUIObject.weidu.text}",
                          style: Style.watermarkSmallWhite)),
                  Visibility(
                    visible: watermarkUIObject.location.visible,
                    child: Text("地址: ${watermarkUIObject.location.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      "时间: ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: Style.watermarkSmallWhite,
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark14 defaultData() {
    return Watermark14(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
