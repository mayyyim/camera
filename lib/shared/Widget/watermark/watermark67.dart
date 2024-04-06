import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark67 extends WaterMarkWidget {
  Watermark67({required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
            dateTime: true,
            jindu: true,
            weidu: true,
            beizhuText: true,
            position: true,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Color(0xFF025F19), width: 1)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: Text(
                "执勤水印",
                style: Style.watermarkMediumWhite,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: watermarkUIObject.minute.visible,
                        child: Text(
                          "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "number"),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const VerticalStick(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: watermarkUIObject.week.visible,
                            child: Text(
                              watermarkUIObject.week.text,
                              style: Style.watermarkSmallWhite,
                            ),
                          ),
                          Visibility(
                            visible: watermarkUIObject.week.visible,
                            child: Text(
                              "${watermarkUIObject.year.text}-${watermarkUIObject.month.text}-${watermarkUIObject.day.text}",
                              style: Style.watermarkSmallWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Visibility(
                      visible: watermarkUIObject.jindu?.visible ?? false,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.map,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                              "${watermarkUIObject.jindu?.text} ${watermarkUIObject.weidu?.text}",
                              style: Style.watermarkSmallWhite),
                        ],
                      )),
                  Visibility(
                    visible: watermarkUIObject.location?.visible ?? false,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text("${watermarkUIObject.location?.text}",
                            style: Style.watermarkSmallWhite),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: watermarkUIObject.beizhuText?.visible ?? false,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.note_alt_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text("${watermarkUIObject.beizhuText?.text}",
                            style: Style.watermarkSmallWhite),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  static Watermark67 defaultData() {
    return Watermark67(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
