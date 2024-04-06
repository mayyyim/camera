import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark45 extends WaterMarkWidget {
  Watermark45({required WatermarkUIObject watermarkUIObject})
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
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.all(2),
      decoration: const BoxDecoration(
          color: Color(0xFF544C9A),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFDF066),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                  child: Text(
                    "治安巡逻",
                    style: TextStyle(
                        color: Color(0xFF272300), fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "工作记录",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.year.text}年${watermarkUIObject.month.text}月${watermarkUIObject.day.text}日",
                    style: Style.watermarkSmallWhite,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: watermarkUIObject.weather?.visible ?? false,
              child: Text("天气: ${watermarkUIObject.weather?.text ?? ""}",
                  style: Style.watermarkSmallWhite),
            ),
            Visibility(
                visible: watermarkUIObject.jindu?.visible ?? false,
                child: Text("经度: ${watermarkUIObject.jindu?.text}",
                    style: Style.watermarkSmallWhite)),
            Visibility(
                visible: watermarkUIObject.weidu?.visible ?? false,
                child: Text("纬度: ${watermarkUIObject.weidu?.text}",
                    style: Style.watermarkSmallWhite)),
            Visibility(
              visible: watermarkUIObject.location?.visible ?? false,
              child: Text("地址: ${watermarkUIObject.location?.text}",
                  style: Style.watermarkSmallWhite),
            ),
            Visibility(
              visible: watermarkUIObject.beizhuText?.visible ?? false,
              child: Text("备注: ${watermarkUIObject.beizhuText?.text}",
                  style: Style.watermarkSmallWhite),
            ),
          ]),
    );
  }

  static Watermark45 defaultData() {
    return Watermark45(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
