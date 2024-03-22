import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark45 extends WaterMarkWidget {
  const Watermark45({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(2),
      decoration: const BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  child: Text(
                    "治安巡逻",
                    style: Style.watermarkMediumWhite,
                  ),
                ),
                SizedBox(width: 2,),
                Text(
                  "工作记录",
                  style: Style.watermarkSmallWhite,
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: Style.watermarkMediumWhite,
                  ),
                ),
                SizedBox(width: 2,),
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                    style: Style.watermarkSmallWhite,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: watermarkUIObject.weather.visible,
              child: Text("天气: ${watermarkUIObject.weather.text}",
                  style: Style.watermarkSmallWhite),
            ),
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
              child: Text("地址: ${watermarkUIObject.location.text}",
                  style: Style.watermarkSmallWhite),
            ),
          ]),
    );
  }

  static Watermark45 defaultData() {
    return Watermark45(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
