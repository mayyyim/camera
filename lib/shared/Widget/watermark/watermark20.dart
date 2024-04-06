import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark20 extends WaterMarkWidget {
  Watermark20({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            customized: true,
            position: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ",
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "clock"),
                ),
              ),
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}:${watermarkUIObject.second.text}",
                  style: const TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "clock"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Visibility(
          visible: watermarkUIObject.customized?.visible ?? false,
          child: Row(
            children: [
              Container(
                color: Colors.orangeAccent,
                width: 8,
                height: 4,
                margin: EdgeInsets.only(right: 4),
              ),
              Text(
                watermarkUIObject.customized?.text ?? "",
                style: Style.watermarkSmallWhite,
              ),
            ],
          ),
        ),
        Visibility(
            visible: watermarkUIObject.location!.visible,
            child: Row(
              children: [
                Container(
                  color: Colors.orangeAccent,
                  width: 8,
                  height: 4,
                  margin: EdgeInsets.only(right: 4),
                ),
                Text(
                  watermarkUIObject.location!.text,
                  style: Style.watermarkSmallWhite,
                ),
              ],
            ))
      ],
    );
  }

  static Watermark20 defaultData() {
    return Watermark20(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
