import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark62 extends WaterMarkWidget {
  const Watermark62({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.green, width: 1)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Text(
                "输电线路巡检",
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: watermarkUIObject.minute.visible,
                        child: Text(
                          "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                          style: Style.watermarkLargeWhite,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const VerticalStick(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: watermarkUIObject.week.visible,
                            child: Text(
                              watermarkUIObject.week.text,
                              style: Style.watermarkSmallWhite,
                            ),
                          ),
                          Visibility(
                            visible: watermarkUIObject.week.visible,
                            child: Text(
                              "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                              style: Style.watermarkSmallWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                    visible: watermarkUIObject.weather.visible,
                    child: Text("天气: ${watermarkUIObject.weather.text}",
                        style: Style.watermarkSmallWhite),
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
                    child: Text("地址: ${watermarkUIObject.location.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark62 defaultData() {
    return Watermark62(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
