import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark33 extends WaterMarkWidget {
  const Watermark33({required WatermarkUIObject watermarkUIObject})
      : super(watermarkUIObject: watermarkUIObject);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: TimeWidget(
            minute: watermarkUIObject.minute,
            hour: watermarkUIObject.hour,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Visibility(
          visible: watermarkUIObject.location.visible,
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 15,
              ),
              const SizedBox(
                width: 3,
              ),
              Text("${watermarkUIObject.location.text}",
                  style: Style.watermarkSmallWhite),
            ],
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Visibility(
          visible: watermarkUIObject.day.visible,
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
                size: 15,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                "${watermarkUIObject.week.text} ${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                style: Style.watermarkSmallWhite,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Visibility(
            visible: watermarkUIObject.beizhuText.visible,
            child: Row(
              children: [
                const Icon(
                  Icons.note,
                  color: Colors.white,
                  size: 15,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text("${watermarkUIObject.beizhuText.text}",
                    style: Style.watermarkSmallWhite),
              ],
            )),
      ],
    );
  }

  static Watermark33 defaultData() {
    return Watermark33(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
