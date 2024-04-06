import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark69 extends WaterMarkWidget {
  Watermark69({required WatermarkUIObject watermarkUIObject})
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
          decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "clock"),
                ),
              ),
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  " ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}:${watermarkUIObject.second.text}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "clock"),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Visibility(
          visible: watermarkUIObject.customized?.visible ?? false,
          child: Row(
            children: [
              const Icon(
                Icons.palette_outlined,
                color: Colors.white,
                size: 15,
              ),
              Text(
                watermarkUIObject.customized?.text ?? "",
                style: Style.watermarkSmallWhite,
              ),
            ],
          ),
        ),
        Visibility(
            visible: watermarkUIObject.location?.visible ?? false,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 15,
                ),
                Text(
                  watermarkUIObject.location?.text ?? "",
                  style: Style.watermarkSmallWhite,
                ),
              ],
            ))
      ],
    );
  }

  static Watermark69 defaultData() {
    return Watermark69(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
