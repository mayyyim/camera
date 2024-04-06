import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark9 extends WaterMarkWidget {
  Watermark9({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
              dateTime: true,
              weather: true,
              jindu: true,
              weidu: true,
              beizhuText: true,
              position: true),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Visibility(
              visible: watermarkUIObject.hour.visible,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.5, vertical: 4),
                    child: Text(watermarkUIObject.hour.text,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "clock")),
                  ),
                  Text(" : ", style: Style.watermarkMediumWhite),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.5, vertical: 4),
                    child: Text(watermarkUIObject.hour.text,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "clock")),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}  ${watermarkUIObject.week.text}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: "clock"),
                  ),
                ),
                Visibility(
                    visible: watermarkUIObject.location!.visible,
                    child: const Divider(
                      color: Colors.yellow,
                      thickness: 2,
                    )),
                Visibility(
                  visible: watermarkUIObject.location!.visible,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        " ${watermarkUIObject.location!.text}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "clock"),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: watermarkUIObject.jindu!.visible,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.map_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        "${watermarkUIObject.jindu!.text} ${watermarkUIObject.weidu!.text}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "clock"),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: watermarkUIObject.beizhuText!.visible,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.note_alt_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        "${watermarkUIObject.beizhuText!.text}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "clock"),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: watermarkUIObject.weather!.visible,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.sunny,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        "${watermarkUIObject.weather!.text}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "clock"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
    );
  }

  static Watermark9 defaultData() {
    return Watermark9(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
