import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark17 extends WaterMarkWidget {
  Watermark17({required WatermarkUIObject watermarkUIObject})
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
      width: 180,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
          color: Color(0xFF052FAA),
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
                    color: Color(0xFFFCEE2B),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text(
                    "治安巡逻",
                    style: Style.watermarkMediumBlack,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text("工作记录",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  width: 4,
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
              visible: watermarkUIObject.location?.visible ?? false,
              child: Text("地址: ${watermarkUIObject.location?.text}",
                  style: Style.watermarkSmallWhite),
            ),
            Visibility(
              visible: watermarkUIObject.beizhuText?.visible ?? false,
              child: Text("备注: ${watermarkUIObject.beizhuText?.text ?? ""}",
                  style: Style.watermarkSmallWhite),
            ),
          ]),
    );
  }

  static Watermark17 defaultData() {
    return Watermark17(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
