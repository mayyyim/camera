import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:cameraApp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark4 extends WaterMarkWidget {
  Watermark4({super.key, required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
              dateTime: true,
              weather: true,
              jindu: true,
              weidu: true,
              beizhuText: true,
              position: true,
              dakabiaotiText: true),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.yellow,
                  ),
                  child: Visibility(
                    visible: watermarkUIObject.dakabiaotiText?.visible ?? false,
                    child: Text(
                      watermarkUIObject.dakabiaotiText?.text ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "Ali",
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Visibility(
                  visible: watermarkUIObject.day.visible,
                  child: Text(
                    "${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "RobotoRegular",
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalStick(
                height: 30,
              ),
              const SizedBox(
                width: 3,
              ),
              Expanded(
                child: Visibility(
                  visible: watermarkUIObject.location?.visible ?? false,
                  child: Text(
                    watermarkUIObject.location?.text != ""
                        ? "${watermarkUIObject.location?.text}\n${watermarkUIObject.jindu?.text} ${watermarkUIObject.weidu?.text}"
                        : "开启定位服务",
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: watermarkUIObject.beizhuText?.visible ?? false,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              decoration: const BoxDecoration(color: Color(0x1A888888)),
              child: Text(
                watermarkUIObject.beizhuText?.text ?? "",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Visibility(
              visible: watermarkUIObject.shijianyanzhengText?.visible ?? false,
              child: Text(
                watermarkUIObject.shijianyanzhengText?.text ?? "",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }

  static Watermark4 defaultData() {
    return Watermark4(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
