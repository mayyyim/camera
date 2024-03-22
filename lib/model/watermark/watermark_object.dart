import 'package:cameraApp/model/watermark/image_object.dart';
import 'package:cameraApp/model/watermark/text_object.dart';
import 'package:cameraApp/model/watermark/watermark_data.dart';
import 'package:cameraApp/services/position_service.dart';
import 'package:cameraApp/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class WatermarkUIObject {
  final TextObject year;
  final TextObject month;
  final TextObject day;
  final TextObject hour;
  final TextObject minute;
  final TextObject week;
  final TextObject location;
  final TextObject jindu;
  final TextObject weidu;
  final ImageObject? imageObject;
  final TextObject customized;
  final TextObject weather;
  final TextObject? dakabiaotiText;
  final TextObject beizhuText;
  final TextObject shijianyanzhengText;
  final TextObject gongchengmingchengText;
  final TextObject shigongdanweiText;
  final TextObject xunjianrenText;
  final TextObject xunjianleixingText;
  final TextObject xunjianquyuText;
  final TextObject zhuchirenText;

  WatermarkUIObject({
    required this.day,
    required this.hour,
    required this.minute,
    required this.year,
    required this.month,
    required this.week,
    required this.location,
    required this.imageObject,
    required this.customized,
    required this.weather,
    this.dakabiaotiText,
    required this.beizhuText,
    required this.shijianyanzhengText,
    required this.jindu,
    required this.weidu,
    required this.gongchengmingchengText,
    required this.shigongdanweiText,
    required this.xunjianrenText,
    required this.xunjianleixingText,
    required this.xunjianquyuText,
    required this.zhuchirenText,
  });

  static WatermarkUIObject fromData(WatermarkData watermarkData) {
    return WatermarkUIObject(
      week: TextObject(text: Utils.getDayOfWeek(watermarkData.dateTime)),
      location: TextObject(text: watermarkData.position.toString()),
      imageObject: watermarkData.imageUrl != null
          ? ImageObject(url: watermarkData.imageUrl!, canEdit: true)
          : null,
      day: TextObject(
          text: Utils.getFormattedDay(watermarkData.dateTime).toString()),
      hour: TextObject(
          text: Utils.getFormattedHour(watermarkData.dateTime).toString()),
      minute: TextObject(
          text: Utils.getFormattedMinute(watermarkData.dateTime).toString()),
      year: TextObject(
          text: Utils.getFormattedYear(watermarkData.dateTime).toString()),
      month: TextObject(
          text: Utils.getFormattedMonth(watermarkData.dateTime).toString()),
      dakabiaotiText: TextObject(text: watermarkData.dakabiaotiText ?? ''),
      beizhuText: TextObject(text: watermarkData.beizhuText ?? ''),
      shijianyanzhengText:
          TextObject(text: watermarkData.shijianyanzhengText ?? ''),
      jindu: TextObject(text: PositionService.longitude),
      weidu: TextObject(text: PositionService.latitude),
      weather: TextObject(text: watermarkData.weather),
      customized: TextObject(
        text: watermarkData.customized,
      ),
      gongchengmingchengText:
          TextObject(text: watermarkData.gongchengmingchengText),
      shigongdanweiText: TextObject(text: watermarkData.shigongdanweiText),
      xunjianrenText: TextObject(text: watermarkData.xunjianrenText),
      xunjianleixingText: TextObject(text: watermarkData.xunjianleixingText),
      xunjianquyuText: TextObject(text: watermarkData.xunjianquyuText),
      zhuchirenText: TextObject(text: watermarkData.zhuchirenText),
    );
  }

  static WatermarkUIObject defaultData() {
    return WatermarkUIObject(
      day: TextObject(text: "01", canEdit: false),
      hour: TextObject(text: "01", canEdit: false),
      minute: TextObject(text: "01", canEdit: false),
      year: TextObject(text: "2024", canEdit: false),
      month: TextObject(text: "01", canEdit: false),
      week: TextObject(text: "星期一", canEdit: false),
      location: TextObject(text: "北京市三里屯", canEdit: false),
      dakabiaotiText: TextObject(text: '定制', canEdit: false),
      shijianyanzhengText: TextObject(text: '时间验证', canEdit: false),
      beizhuText: TextObject(text: '备注', canEdit: false),
      imageObject: null,
      jindu: TextObject(text: "00000S", canEdit: false),
      weidu: TextObject(text: "00000N", canEdit: false),
      weather: TextObject(text: "晴天", canEdit: false),
      customized: TextObject(text: "备注", canEdit: false),
      shigongdanweiText: TextObject(text: "施工单位", canEdit: false),
      gongchengmingchengText: TextObject(text: "工程名称", canEdit: false),
      xunjianrenText: TextObject(text: "巡检人", canEdit: false),
      xunjianquyuText: TextObject(text: "巡检区域", canEdit: false),
      xunjianleixingText: TextObject(text: "巡检类型", canEdit: false),
      zhuchirenText: TextObject(text: "主持人", canEdit: false),
    );
  }

  WatermarkUIObject copyWith({
    TextObject? year,
    TextObject? month,
    TextObject? day,
    TextObject? minute,
    TextObject? hour,
    TextObject? week,
    TextObject? location,
    ImageObject? imageObject,
    TextObject? customized,
    TextObject? weather,
    TextObject? dakabiaotiText,
    TextObject? beizhuText,
    TextObject? shijianyanzhengText,
    TextObject? jindu,
    TextObject? weidu,
    TextObject? gongchengmingchengText,
    TextObject? shigongdanweiText,
    TextObject? xunjianrenText,
    TextObject? xunjianleixingText,
    TextObject? xunjianquyuText,
    TextObject? zhuchirenText,
  }) {
    return WatermarkUIObject(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      week: week ?? this.week,
      location: location ?? this.location,
      imageObject: imageObject ?? this.imageObject,
      customized: customized ?? this.customized,
      weather: weather ?? this.weather,
      dakabiaotiText: dakabiaotiText ?? this.dakabiaotiText,
      beizhuText: beizhuText ?? this.beizhuText,
      shijianyanzhengText: shijianyanzhengText ?? this.shijianyanzhengText,
      weidu: weidu ?? this.weidu,
      jindu: jindu ?? this.jindu,
      gongchengmingchengText:
          gongchengmingchengText ?? this.gongchengmingchengText,
      shigongdanweiText: shigongdanweiText ?? this.shigongdanweiText,
      xunjianleixingText: xunjianleixingText ?? this.xunjianleixingText,
      xunjianquyuText: xunjianquyuText ?? this.xunjianquyuText,
      xunjianrenText: xunjianrenText ?? this.xunjianrenText,
      zhuchirenText: zhuchirenText ?? this.zhuchirenText,
    );
  }

  WatermarkUIObject setTimeVisible(bool visible) {
    return WatermarkUIObject(
      year: year.copyWith(visible: visible),
      month: month.copyWith(visible: visible),
      day: day.copyWith(visible: visible),
      hour: hour.copyWith(visible: visible),
      minute: minute.copyWith(visible: visible),
      week: week.copyWith(visible: visible),
      location: location,
      imageObject: imageObject,
      customized: customized,
      weather: weather,
      shijianyanzhengText: shijianyanzhengText,
      beizhuText: beizhuText,
      dakabiaotiText: dakabiaotiText,
      weidu: weidu,
      jindu: jindu,
      gongchengmingchengText: gongchengmingchengText,
      shigongdanweiText: shigongdanweiText,
      xunjianrenText: xunjianrenText,
      xunjianleixingText: xunjianleixingText,
      xunjianquyuText: xunjianquyuText,
      zhuchirenText: zhuchirenText,
    );
  }

  WatermarkUIObject updateDateTime(DateTime dateTime) {
    return WatermarkUIObject(
      year: year.copyWith(text: Utils.getFormattedYear(dateTime).toString()),
      month: month.copyWith(text: Utils.getFormattedMonth(dateTime).toString()),
      day: day.copyWith(text: Utils.getFormattedDay(dateTime).toString()),
      hour: hour.copyWith(text: Utils.getFormattedHour(dateTime).toString()),
      minute: hour.copyWith(text: Utils.getFormattedHour(dateTime).toString()),
      week: week.copyWith(text: Utils.getDayOfWeek(dateTime)),
      location: location,
      imageObject: imageObject,
      customized: customized,
      weather: weather,
      shijianyanzhengText: shijianyanzhengText,
      beizhuText: beizhuText,
      dakabiaotiText: dakabiaotiText,
      weidu: weidu,
      jindu: jindu,
      gongchengmingchengText: gongchengmingchengText,
      shigongdanweiText: shigongdanweiText,
      xunjianrenText: xunjianrenText,
      xunjianleixingText: xunjianleixingText,
      xunjianquyuText: xunjianquyuText,
      zhuchirenText: zhuchirenText,
    );
  }
}
