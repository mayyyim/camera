import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark31 extends WaterMarkWidget {
  const Watermark31({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
  return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.location_on_outlined,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(
              width: 3,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                    style: Style.watermarkMediumWhite,
                  ),
                ),
                Visibility(
                  visible: watermarkUIObject.location.visible,
                  child: Text("${watermarkUIObject.location.text}",
                      style: Style.watermarkMediumWhite),
                ),
              ],
            )
          ]),
    );
  }

  static Watermark31 defaultData() {
    return Watermark31(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
