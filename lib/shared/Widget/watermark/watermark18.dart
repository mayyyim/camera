import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark18 extends WaterMarkWidget {
  Watermark18({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            weidu: true,
            beizhuText: true,
            position: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: watermarkUIObject.day.visible,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Visibility(
                      visible: watermarkUIObject.day.visible,
                      child: Text(
                        "${watermarkUIObject.year.text}.${watermarkUIObject.month.text}.${watermarkUIObject.day.text}",
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "clock"),
                      ),
                    ),
                    Visibility(
                      visible: watermarkUIObject.day.visible,
                      child: Text(
                        "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}:${watermarkUIObject.second.text}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: "clock"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: watermarkUIObject.beizhuText?.visible ?? false,
            child: Text("${watermarkUIObject.beizhuText?.text ?? ""}",
                style: Style.watermarkLargeWhite),
          ),
          Visibility(
            visible: watermarkUIObject.location?.visible ?? false,
            child: Text("${watermarkUIObject.location?.text ?? ""}",
                style: Style.watermarkLargeWhite),
          ),
        ],
      ),
    );
  }

  static Watermark18 defaultData() {
    return Watermark18(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
