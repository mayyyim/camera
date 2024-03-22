import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark38 extends WaterMarkWidget {
  const Watermark38({required WatermarkUIObject watermarkUIObject})
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
            Container(
              width: 300,
              padding: EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Text(
                "治安巡逻",
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
                    visible: watermarkUIObject.xunjianleixingText.visible,
                    child: Text(
                      "巡检类型: ${watermarkUIObject.xunjianleixingText.text}",
                      style: Style.watermarkSmallWhite,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.xunjianquyuText.visible,
                    child: Text(
                      "巡检区域: ${watermarkUIObject.xunjianquyuText.text}",
                      style: Style.watermarkSmallWhite,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.xunjianrenText.visible,
                    child: Text(
                      "巡检人: ${watermarkUIObject.xunjianrenText.text}",
                      style: Style.watermarkSmallWhite,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      "拍摄时间: ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: Style.watermarkSmallWhite,
                    ),
                  ),
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
                    child: Text("地点: ${watermarkUIObject.location.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark38 defaultData() {
    return Watermark38(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
