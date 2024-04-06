import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark1 extends WaterMarkWidget {
  Watermark1({super.key, required WatermarkUIObject watermarkUIObject})
      : super(
            watermarkUIObject: watermarkUIObject,
            watermarkVisibleMap: WatermarkVisibleMap(
                dateTime: true,
                jindu: true,
                weidu: true,
                position: true,
                beizhuText: true,
                shijianyanzhengText: true,
                dakabiaotiText: true));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 120,
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
                  padding: const EdgeInsets.all(2),
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
                          fontSize: 13,
                          fontFamily: 'Roboto',
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
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalStick(
                height: 40,
              ),
              const SizedBox(
                width: 3,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: watermarkUIObject.location?.visible ?? false,
                      child: Text(
                        watermarkUIObject.location != null
                            ? "${watermarkUIObject.location!.text}"
                            : "开启定位服务",
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: watermarkUIObject.jindu?.visible ?? false,
                      child: Text(
                        watermarkUIObject.jindu != null
                            ? "${watermarkUIObject.jindu?.text}"
                            : "开启定位服务",
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: watermarkUIObject.weidu?.visible ?? false,
                      child: Text(
                        watermarkUIObject.weidu != null
                            ? "${watermarkUIObject.jindu?.text}"
                            : "开启定位服务",
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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

  static Watermark1 defaultData() {
    return Watermark1(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
