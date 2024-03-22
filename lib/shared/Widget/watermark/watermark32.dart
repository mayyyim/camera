import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark32 extends WaterMarkWidget {
  const Watermark32({required WatermarkUIObject watermarkUIObject})
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
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0x11000000),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      VerticalStick(
                        color: Colors.blue,
                        height: 10,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "工程记录",
                        style: Style.watermarkMediumWhite,
                      ),
                    ],
                  ),
                  Visibility(
                      visible: watermarkUIObject.gongchengmingchengText.visible,
                      child: Text(
                        "工程名称：" + watermarkUIObject.gongchengmingchengText.text,
                        style: Style.watermarkSmallWhite,
                      )),
                  Visibility(
                      visible: watermarkUIObject.shigongdanweiText.visible,
                      child: Text(
                        "施工单位：" + watermarkUIObject.shigongdanweiText.text,
                        style: Style.watermarkSmallWhite,
                      ))
                ],
              ),
            ),
            Visibility(
              visible: watermarkUIObject.day.visible,
              child: Text(
                "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}  ${watermarkUIObject.week.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                style: Style.watermarkSmallWhite,
              ),
            ),
            Visibility(
              visible: watermarkUIObject.location.visible,
              child: Text("${watermarkUIObject.location.text}",
                  style: Style.watermarkSmallWhite),
            )
          ]),
    );
  }

  static Watermark32 defaultData() {
    return Watermark32(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
