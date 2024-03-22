import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark30 extends WaterMarkWidget {
  const Watermark30({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white38,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 33,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        "日常保洁",
                        style: Style.watermarkMediumBlack,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(5)),
                        ),
                        child: Column(
                          children: [
                            Visibility(
                              visible: watermarkUIObject.day.visible,
                              child: Text(
                                "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                                style: Style.watermarkSmallBlack,
                              ),
                            ),
                            Visibility(
                              visible: watermarkUIObject.day.visible,
                              child: Text(
                                "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                                style: Style.watermarkVerySmallBlack,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: watermarkUIObject.weather.visible,
                  child: Text("天气: ${watermarkUIObject.weather.text}",
                      style: Style.watermarkSmallBlack),
                ),
                Visibility(
                  visible: watermarkUIObject.location.visible,
                  child: Text("地址: ${watermarkUIObject.location.text}",
                      style: Style.watermarkSmallBlack),
                ),
                Visibility(
                  visible: watermarkUIObject.customized.visible,
                  child: Text("备注: ${watermarkUIObject.location.text}",
                      style: Style.watermarkSmallBlack),
                ),
              ],
            )
          ]),
    );
  }

  static Watermark30 defaultData() {
    return Watermark30(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
