import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark31 extends WaterMarkWidget {
  Watermark31({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            beizhuText: true,
            weather: true,
            position: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
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
                        color: Color(0xFFC0E5E0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        "日常保洁",
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF33446F)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5F8FF),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(5)),
                        ),
                        child: Column(
                          children: [
                            Visibility(
                              visible: watermarkUIObject.day.visible,
                              child: Text(
                                "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xFF33446F)),
                              ),
                            ),
                            Visibility(
                              visible: watermarkUIObject.day.visible,
                              child: Text(
                                "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                                style: const TextStyle(
                                    fontSize: 8, color: Color(0xFF33446F)),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: watermarkUIObject.weather?.visible ?? false,
                    child: Text("天气: ${watermarkUIObject.weather?.text ?? ""}",
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF33446F))),
                  ),
                  Visibility(
                    visible: watermarkUIObject.location?.visible ?? false,
                    child: Text("地址: ${watermarkUIObject.location?.text}",
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF33446F))),
                  ),
                  Visibility(
                    visible: watermarkUIObject.customized?.visible ?? false,
                    child: Text("备注: ${watermarkUIObject.location?.text}",
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF33446F))),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark31 defaultData() {
    return Watermark31(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
