import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark3 extends WaterMarkWidget {
  Watermark3({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
              dateTime: true,
              weather: true,
              jindu: true,
              weidu: true,
              position: true,
              beizhuText: true),
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          width: 200,
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5))),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Visibility(
                    visible: watermarkUIObject.jindu?.visible ?? false,
                    child: Text("经度: ${watermarkUIObject.jindu?.text}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ))),
                Visibility(
                    visible: watermarkUIObject.weidu?.visible ?? false,
                    child: Text("纬度: ${watermarkUIObject.weidu?.text}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ))),
                Visibility(
                  visible: watermarkUIObject.location?.visible ?? false,
                  child: Text("地址: ${watermarkUIObject.location?.text}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                        "时间: ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ))),
                Visibility(
                  visible: watermarkUIObject.weather?.visible ?? false,
                  child: Text("天气: ${watermarkUIObject.weather?.text ?? ""}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                Visibility(
                  visible: watermarkUIObject.beizhuText?.visible ?? false,
                  child: Text("备注: ${watermarkUIObject.beizhuText?.text ?? ""}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ]),
        ),
        Container(
          height: 23,
          width: 200,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: Text(
            "现场拍照",
            style: Style.watermarkMediumBlack,
          ),
        )
      ],
    );
  }

  static Watermark3 defaultData() {
    return Watermark3(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
