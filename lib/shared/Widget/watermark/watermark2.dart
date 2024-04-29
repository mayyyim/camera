import 'dart:html';

import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark2 extends WaterMarkWidget {
  Watermark2({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            weather: true,
            jindu: true,
            weidu: true,
            position: true,
            beizhuText: true,
            suduText: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 150, minHeight: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              TimeWidget(
                hour: watermarkUIObject.hour,
                minute: watermarkUIObject.minute,
                textSize: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 22,
                width: 2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1),
                  ),
                  color: Colors.blue,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      watermarkUIObject.year.text +
                          "-" +
                          watermarkUIObject.month.text +
                          "-" +
                          watermarkUIObject.day.text, // 第二行文本
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0), // 再次添加间距
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: watermarkUIObject.week.visible,
                        child: Text(
                          watermarkUIObject.week.text,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Visibility(
                        visible: watermarkUIObject.weather?.visible ?? false,
                        child: Text(
                          watermarkUIObject.weather?.text ?? "",
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: watermarkUIObject.beizhuText?.visible ?? false,
                    child: Text(
                      "备注" + (watermarkUIObject.beizhuText?.text ?? ""),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.suduText?.visible ?? false,
                    child: Text(
                      "速度" + (watermarkUIObject.suduText?.text ?? ""),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.jindu?.visible ?? false,
                    child: Text(
                      "经度" + (watermarkUIObject.jindu?.text ?? ""),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.weidu?.visible ?? false,
                    child: Text(
                      "纬度" + (watermarkUIObject.weidu?.text ?? ""),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 6.0), // 更大的间距
          Expanded(
            child: Text(
              watermarkUIObject.location != null ? watermarkUIObject.location!.text : "请开启定位服务",
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Watermark2 defaultData() {
    return Watermark2(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
