import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark37 extends WaterMarkWidget {
  const Watermark37({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.grey,
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
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber_outlined, color: Colors.white),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "工程记录",
                        style: Style.watermarkMediumWhite,
                      ),
                      Visibility(
                        visible: watermarkUIObject.day.visible,
                        child: Text(
                          "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                          style: Style.watermarkSmallWhite,
                        ),
                      ),
                    ],
                  ),
                ],
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
                  Visibility(
                    visible: watermarkUIObject.shigongdanweiText.visible,
                    child: Text(
                        "施工单位: ${watermarkUIObject.shigongdanweiText.text}",
                        style: Style.watermarkSmallWhite),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark37 defaultData() {
    return Watermark37(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
