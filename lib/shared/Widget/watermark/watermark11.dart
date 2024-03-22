import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark11 extends WaterMarkWidget {
  const Watermark11({required WatermarkUIObject watermarkUIObject})
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
            Visibility(
              visible: watermarkUIObject.customized?.visible ?? false,
              child: Text("${watermarkUIObject.customized?.text}",
                  style: Style.watermarkMediumWhite),
            ),
            Row(
              children: [
                VerticalStick(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                          visible: watermarkUIObject.jindu.visible,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(color: Color(0xAA111111)),
                            child: Text(
                                "${watermarkUIObject.jindu.text} ${watermarkUIObject.weidu.text}",
                                style: Style.watermarkSmallWhite),
                          )),
                      Visibility(
                        visible: watermarkUIObject.day.visible,
                        child: Text(
                          "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                          style: Style.watermarkSmallWhite,
                        ),
                      ),
                      Visibility(
                        visible: watermarkUIObject.location.visible,
                        child: Text("${watermarkUIObject.location.text}",
                            style: Style.watermarkSmallWhite),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
    );
  }

  static Watermark11 defaultData() {
    return Watermark11(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
