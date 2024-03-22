import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark53 extends WaterMarkWidget {
  const Watermark53({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                  style: Style.watermarkLargeWhite,
                ),
              ),
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                  style: Style.watermarkVerySmallWhite,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          const VerticalStick(
            color: Colors.white,
            height: 40,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: watermarkUIObject.beizhuText.visible,
                child: Text("${watermarkUIObject.beizhuText.text}",
                    style: Style.watermarkMediumWhite),
              ),
              Visibility(
                visible: watermarkUIObject.location.visible,
                child: Text("${watermarkUIObject.location.text}",
                    style: Style.watermarkMediumWhite),
              ),
            ],
          )
        ],
      ),
    );
  }

  static Watermark53 defaultData() {
    return Watermark53(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
