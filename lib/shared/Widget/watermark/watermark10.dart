import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/model/watermark/watermark_object.dart';
import 'package:cameraApp/shared/Widget/verticle_stick.dart';
import 'package:cameraApp/shared/Widget/watermark/time_widget.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Watermark10 extends WaterMarkWidget {
  Watermark10({super.key, required WatermarkUIObject watermarkUIObject})
      : super(
          watermarkUIObject: watermarkUIObject,
          watermarkVisibleMap: WatermarkVisibleMap(
              dateTime: true,
              weather: true,
              jindu: true,
              weidu: true,
              beizhuText: true,
              suduText: true,
              position: true,
              shijianyanzhengText: true),
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
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: Colors.yellow,
                  ),
                  child: Visibility(
                    visible: watermarkUIObject.dakabiaotiText?.visible ?? false,
                    child: Text(
                      watermarkUIObject.dakabiaotiText?.text ?? '',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w900, fontFamily: "han"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Visibility(
                  visible: watermarkUIObject.hour.visible,
                  child: Text("${watermarkUIObject.hour.text}:${watermarkUIObject.minute.text}",
                      style: const TextStyle(
                          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600, fontFamily: "clock")),
                ),
                Visibility(
                  visible: watermarkUIObject.imageObject?.visible ?? false,
                  child: Image.asset(watermarkUIObject.imageObject?.url ?? "assets/icon/caijian.png"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3,
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
                    watermarkUIObject.location != null
                        ? "${watermarkUIObject.location!.text}\n${watermarkUIObject.jindu?.text ?? ""} ${watermarkUIObject.weidu?.text ?? ""}"
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
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Visibility(
            visible: watermarkUIObject.suduText?.visible ?? false,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              decoration: const BoxDecoration(color: Color(0x1A888888)),
              child: Text(
                "速度" + (watermarkUIObject.suduText?.text ?? ""),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Visibility(
              visible: watermarkUIObject.shijianyanzhengText?.visible ?? false,
              child: Text(
                watermarkUIObject.shijianyanzhengText?.text ?? "",
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }

  static Watermark10 defaultData() {
    return Watermark10(watermarkUIObject: WatermarkUIObject.defaultData());
  }
}
