import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark6 extends WaterMarkWidget {
  Watermark6({required WatermarkUIObject watermarkUIObject})
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
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: <Widget>[
        Visibility(
          visible: watermarkUIObject.day.visible,
          child: Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 2),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            ),
            child: const Text(
              "打卡记录",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          ),
          child: Visibility(
            visible: watermarkUIObject.day.visible,
            child: Text(
              "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
              style:
                  const TextStyle(color: Colors.black, fontFamily: "Roboto", fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.year.text}.${watermarkUIObject.month.text}.${watermarkUIObject.day.text} ${watermarkUIObject.week.text}",
                  style: Style.watermarkSmallWhite,
                ),
              ),
              Visibility(
                visible: watermarkUIObject.location?.visible ?? false,
                child: Text("${watermarkUIObject.location?.text}", style: Style.watermarkSmallWhite),
              ),
              Visibility(
                visible: watermarkUIObject.jindu?.visible ?? false,
                child: Text("${watermarkUIObject.jindu?.text}", style: Style.watermarkSmallWhite),
              ),
              Visibility(
                visible: watermarkUIObject.weidu?.visible ?? false,
                child: Text("${watermarkUIObject.weidu?.text}", style: Style.watermarkSmallWhite),
              ),
              Visibility(
                visible: watermarkUIObject.weather?.visible ?? false,
                child: Text("${watermarkUIObject.weather?.text}", style: Style.watermarkSmallWhite),
              ),
              Visibility(
                visible: watermarkUIObject.beizhuText?.visible ?? false,
                child: Text((watermarkUIObject.beizhuText?.text ?? ""), style: Style.watermarkSmallWhite),
              ),
              Visibility(
                visible: watermarkUIObject.suduText?.visible ?? false,
                child: Text("速度:" + (watermarkUIObject.suduText?.text ?? ""), style: Style.watermarkSmallWhite),
              ),
            ],
          ),
        )
      ]),
    );
  }

  static Watermark6 defaultData() {
    return Watermark6(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
