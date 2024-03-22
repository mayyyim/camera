import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark8 extends WaterMarkWidget {
  const Watermark8({required WatermarkUIObject watermarkUIObject})
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      color: Colors.green,
                    ),
                    child: Visibility(
                      visible:
                          watermarkUIObject.dakabiaotiText?.visible ?? false,
                      child: Text(
                        watermarkUIObject.dakabiaotiText?.text ?? '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TimeWidget(
                    hour: watermarkUIObject.hour,
                    minute: watermarkUIObject.minute,
                    textColor: Colors.green,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: watermarkUIObject.day.visible,
                    child: Text(
                      "${watermarkUIObject.week.text} ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                      style: Style.watermarkMediumWhite,
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.location.visible,
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xAA111111)),
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                      child: Text("·${watermarkUIObject.location.text}",
                          style: Style.watermarkSmallWhite),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark8 defaultData() {
    return Watermark8(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
