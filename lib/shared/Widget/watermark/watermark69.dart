import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark69 extends WaterMarkWidget {
  const Watermark69({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

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
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text} ",
                  style: Style.watermarkSmallBlack,
                ),
              ),
              Visibility(
                visible: watermarkUIObject.day.visible,
                child: Text(
                  " ${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text} ",
                  style: Style.watermarkMediumBlack,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
        Visibility(
          visible: watermarkUIObject.customized.visible,
          child: Row(
            children: [
              const Icon(
                Icons.palette_outlined,
                color: Colors.white,
                size: 15,
              ),
              Text(
                watermarkUIObject.customized.text ?? "",
                style: Style.watermarkSmallWhite,
              ),
            ],
          ),
        ),
        Visibility(
            visible: watermarkUIObject.location.visible,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 15,
                ),
                Text(
                  watermarkUIObject.location.text,
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
