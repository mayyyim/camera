import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark32 extends WaterMarkWidget {
  Watermark32({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
              dateTime: true,
              weather: true,
              jindu: true,
              weidu: true,
              beizhuText: true,
              position: true,
              shigongdanweiText: true,
              gongchengmingchengText: true),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF5A81BB),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const VerticalStick(
                        color: Color(0xFFFCB505),
                        height: 10,
                        width: 35,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "工程记录",
                        style: Style.watermarkMediumWhite,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                      visible:
                          watermarkUIObject.gongchengmingchengText?.visible ??
                              false,
                      child: Text(
                        "工程名称：${watermarkUIObject.gongchengmingchengText?.text ?? ""}",
                        style: Style.watermarkSmallWhite,
                      )),
                  Visibility(
                      visible:
                          watermarkUIObject.shigongdanweiText?.visible ?? false,
                      child: Text(
                        "施工单位：${watermarkUIObject.shigongdanweiText?.text ?? ""}",
                        style: Style.watermarkSmallWhite,
                      )),
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}  ${watermarkUIObject.week.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: Style.watermarkSmallWhite,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.location?.visible ?? false,
                    child: Text("${watermarkUIObject.location?.text}",
                        style: Style.watermarkSmallWhite),
                  )
                ],
              ),
            ),
          ]),
    );
  }

  static Watermark32 defaultData() {
    return Watermark32(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
