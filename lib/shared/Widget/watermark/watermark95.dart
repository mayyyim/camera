import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark95 extends WaterMarkWidget {
  Watermark95({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            position: true,
            weather: true,
            suduText: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: <Widget>[
        Column(
          children: [
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF04BDFC),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Text(
                "打卡记录",
                style: Style.watermarkMediumWhite,
              ),
            ),
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
              ),
              child: Text(
                "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600, fontFamily: "number"),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.week.text}",
                  style: Style.watermarkMediumWhite,
                ),
              ),
              Visibility(
                visible: watermarkUIObject.weather?.visible ?? false,
                child: Text("${watermarkUIObject.weather?.text ?? ""}", style: Style.watermarkMediumWhite),
              ),
              Visibility(
                visible: watermarkUIObject.location?.visible ?? false,
                child: Text("${watermarkUIObject.location?.text}", style: Style.watermarkMediumWhite),
              ),
              Visibility(
                visible: watermarkUIObject.suduText?.visible ?? false,
                child: Text("速度：${watermarkUIObject.suduText?.text}", style: Style.watermarkMediumWhite),
              ),
            ],
          ),
        )
      ]),
    );
  }

  static Watermark95 defaultData() {
    return Watermark95(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
