import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark15 extends WaterMarkWidget {
  Watermark15({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            weather: true,
            jindu: true,
            weidu: true,
            beizhuText: true,
            position: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 300,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Color(0xFF4277B9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: watermarkUIObject.weather?.visible ?? false,
                    child: Text("天气: ${watermarkUIObject.weather?.text ?? ""}",
                        style: Style.watermarkSmallBlack),
                  ),
                  Visibility(
                      visible: watermarkUIObject.jindu?.visible ?? false,
                      child: Text("经度: ${watermarkUIObject.jindu?.text}",
                          style: Style.watermarkSmallBlack)),
                  Visibility(
                      visible: watermarkUIObject.weidu?.visible ?? false,
                      child: Text("纬度: ${watermarkUIObject.weidu?.text}",
                          style: Style.watermarkSmallBlack)),
                  Visibility(
                    visible: watermarkUIObject.location?.visible ?? false,
                    child: Text("地点: ${watermarkUIObject.location?.text}",
                        style: Style.watermarkSmallBlack),
                  ),
                  Visibility(
                    visible: watermarkUIObject.beizhuText?.visible ?? false,
                    child: Text("备注: ${watermarkUIObject.beizhuText?.text}",
                        style: Style.watermarkSmallBlack),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark15 defaultData() {
    return Watermark15(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
