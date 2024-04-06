import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark38 extends WaterMarkWidget {
  Watermark38({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            weather: true,
            jindu: true,
            weidu: true,
            beizhuText: true,
            position: true,
            xunjianleixingText: true,
            xunjianrenText: true,
            xunjianquyuText: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Color(0xFFB7B7B7),
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
                color: Color(0xFF025F19),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Text(
                "治安巡逻",
                style: Style.watermarkMediumWhite,
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
                    visible:
                        watermarkUIObject.xunjianleixingText?.visible ?? false,
                    child: Text(
                      "巡检类型: ${watermarkUIObject.xunjianleixingText?.text}",
                      style: Style.watermarkSmallBlack,
                    ),
                  ),
                  Visibility(
                    visible:
                        watermarkUIObject.xunjianquyuText?.visible ?? false,
                    child: Text(
                      "巡检区域: ${watermarkUIObject.xunjianquyuText?.text}",
                      style: Style.watermarkSmallBlack,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.xunjianrenText?.visible ?? false,
                    child: Text(
                      "巡检人: ${watermarkUIObject.xunjianrenText?.text}",
                      style: Style.watermarkSmallBlack,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      "拍摄时间: ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: Style.watermarkSmallBlack,
                    ),
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
                  Visibility(
                    visible: watermarkUIObject.weather?.visible ?? false,
                    child: Text("天气: ${watermarkUIObject.weather?.text}",
                        style: Style.watermarkSmallBlack),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark38 defaultData() {
    return Watermark38(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
