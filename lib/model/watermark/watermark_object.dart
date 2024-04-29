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
  final TextObject second;
  final TextObject week;
  final TextObject? location;
  final TextObject? jindu;
  final TextObject? weidu;
  final ImageObject? imageObject;
  final TextObject? customized;
  final TextObject? weather;
  final TextObject? dakabiaotiText;
  final TextObject? beizhuText;
  final TextObject? shijianyanzhengText;
  final TextObject? gongchengmingchengText;
  final TextObject? shigongdanweiText;
  final TextObject? xunjianrenText;
  final TextObject? xunjianleixingText;
  final TextObject? xunjianquyuText;
  final TextObject? zhuchirenText;
  final TextObject? suduText; //速度
  final TextObject? tianjiazidingyixiang; //添加自定义项
  final TextObject? bianhaoText; //编号
  final TextObject? haibaText; //海拔
  final TextObject? shoujihaoText; //手机号
  final TextObject? IMEIText; //IMEI
  final TextObject? jishuText; //计数
  final TextObject? jianlizerenrenText; // 监理责任人
  final TextObject? jungongdaojishiText; // 竣工倒计时
  final TextObject? jianshedanweiText; //建设单位
  final TextObject? jianlidanweiText; //监理单位
  final TextObject? shejidanweiText; //设计单位
  final TextObject? kanchadanweiText; //勘察单位
  final TextObject? miaoshuText; // 描述
  final TextObject? dabiaotiText; //大标题
  final TextObject? xiaobiaotxiText; // 小标

  WatermarkUIObject({
    required this.day,
    required this.hour,
    required this.minute,
    required this.second,
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
    this.suduText,
    this.tianjiazidingyixiang,
    this.bianhaoText,
    this.haibaText,
    this.shoujihaoText,
    this.IMEIText,
    this.jishuText,
    this.jianlizerenrenText,
    this.jungongdaojishiText,
    this.jianshedanweiText,
    this.jianlidanweiText,
    this.shejidanweiText,
    this.kanchadanweiText,
    this.miaoshuText,
    this.dabiaotiText,
    this.xiaobiaotxiText,
  });

  static WatermarkUIObject fromData(WatermarkData watermarkData) {
    return WatermarkUIObject(
      week: TextObject(text: Utils.getDayOfWeek(watermarkData.dateTime)),
      location: TextObject(text: watermarkData.position ?? '请开启位置权限'),
      imageObject: watermarkData.imageUrl != null ? ImageObject(url: watermarkData.imageUrl!, canEdit: true) : null,
      day: TextObject(text: Utils.getFormattedDay(watermarkData.dateTime).toString()),
      hour: TextObject(text: Utils.getFormattedHour(watermarkData.dateTime).toString()),
      minute: TextObject(text: Utils.getFormattedMinute(watermarkData.dateTime).toString()),
      year: TextObject(text: Utils.getFormattedYear(watermarkData.dateTime).toString()),
      second: TextObject(text: Utils.getFormattedSecond(watermarkData.dateTime).toString()),
      month: TextObject(text: Utils.getFormattedMonth(watermarkData.dateTime).toString()),
      dakabiaotiText: TextObject(text: watermarkData.dakabiaotiText ?? ''),
      beizhuText: TextObject(text: watermarkData.beizhuText ?? ''),
      shijianyanzhengText: TextObject(text: watermarkData.shijianyanzhengText ?? ''),
      jindu: TextObject(text: PositionService.longitude),
      weidu: TextObject(text: PositionService.latitude),
      weather: watermarkData.weather == null ? null : TextObject(text: watermarkData.weather!),
      customized: watermarkData.customized == null
          ? null
          : TextObject(
              text: watermarkData.customized!,
            ),
      gongchengmingchengText:
          watermarkData.gongchengmingchengText == null ? null : TextObject(text: watermarkData.gongchengmingchengText!),
      shigongdanweiText:
          watermarkData.shigongdanweiText == null ? null : TextObject(text: watermarkData.shigongdanweiText!),
      xunjianrenText: watermarkData.xunjianrenText == null ? null : TextObject(text: watermarkData.xunjianrenText!),
      xunjianleixingText:
          watermarkData.xunjianleixingText == null ? null : TextObject(text: watermarkData.xunjianleixingText!),
      xunjianquyuText: watermarkData.xunjianquyuText == null ? null : TextObject(text: watermarkData.xunjianquyuText!),
      zhuchirenText: watermarkData.zhuchirenText == null ? null : TextObject(text: watermarkData.zhuchirenText!),
      suduText: watermarkData.suduText == null ? null : TextObject(text: watermarkData.suduText!),
      tianjiazidingyixiang:
          watermarkData.tianjiazidingyixiang == null ? null : TextObject(text: watermarkData.tianjiazidingyixiang!),
      bianhaoText: watermarkData.bianhaoText == null ? null : TextObject(text: watermarkData.bianhaoText!),
      haibaText: watermarkData.haibaText == null ? null : TextObject(text: watermarkData.haibaText!),
      shoujihaoText: watermarkData.shoujihaoText == null ? null : TextObject(text: watermarkData.shoujihaoText!),
      IMEIText: watermarkData.IMEIText == null ? null : TextObject(text: watermarkData.IMEIText!),
      jishuText: watermarkData.jishuText == null ? null : TextObject(text: watermarkData.jishuText!),
      jianlizerenrenText:
          watermarkData.jianlizerenrenText == null ? null : TextObject(text: watermarkData.jianlizerenrenText!),
      jungongdaojishiText: watermarkData.jungongdaojishiText == null
          ? null
          : TextObject(text: watermarkData.jungongdaojishiText!.toLocal().toString()),
      jianshedanweiText:
          watermarkData.jianshedanweiText == null ? null : TextObject(text: watermarkData.jianshedanweiText!),
      jianlidanweiText:
          watermarkData.jianlidanweiText == null ? null : TextObject(text: watermarkData.jianlidanweiText!),
      shejidanweiText: watermarkData.shejidanweiText == null ? null : TextObject(text: watermarkData.shejidanweiText!),
      kanchadanweiText:
          watermarkData.kanchadanweiText == null ? null : TextObject(text: watermarkData.kanchadanweiText!),
      miaoshuText: watermarkData.miaoshuText == null ? null : TextObject(text: watermarkData.miaoshuText!),
      dabiaotiText: watermarkData.dakabiaotiText == null ? null : TextObject(text: watermarkData.dabiaotiText!),
      xiaobiaotxiText: watermarkData.xiaobiaotiText == null ? null : TextObject(text: watermarkData.xiaobiaotiText!),
    );
  }

  static WatermarkUIObject defaultData() {
    return WatermarkUIObject(
      day: TextObject(text: "01", canEdit: false),
      hour: TextObject(text: "13", canEdit: false),
      minute: TextObject(text: "15", canEdit: false),
      second: TextObject(text: "15", canEdit: false),
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
      suduText: TextObject(text: "", canEdit: false),
      tianjiazidingyixiang: TextObject(text: "", canEdit: false),
      bianhaoText: TextObject(text: "", canEdit: false),
      shoujihaoText: TextObject(text: "", canEdit: false),
      IMEIText: TextObject(text: "", canEdit: false),
      jishuText: TextObject(text: "", canEdit: false),
      jianlizerenrenText: TextObject(text: "", canEdit: false),
      jungongdaojishiText: TextObject(text: "", canEdit: false),
      jianshedanweiText: TextObject(text: "", canEdit: false),
      jianlidanweiText: TextObject(text: "", canEdit: false),
      shejidanweiText: TextObject(text: "", canEdit: false),
      kanchadanweiText: TextObject(text: "", canEdit: false),
      miaoshuText: TextObject(text: "", canEdit: false),
      dabiaotiText: TextObject(text: "", canEdit: false),
      xiaobiaotxiText: TextObject(text: "", canEdit: false),
    );
  }

  WatermarkUIObject copyWith({
    TextObject? year,
    TextObject? month,
    TextObject? day,
    TextObject? minute,
    TextObject? hour,
    TextObject? second,
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
    TextObject? suduText,
    TextObject? tianjiazidingyixiang,
    TextObject? bianhaoText,
    TextObject? haibaText,
    TextObject? shoujihaoText,
    TextObject? IMEIText,
    TextObject? jishuText,
    TextObject? jianlizerenrenText,
    TextObject? jungongdaojishiText,
    TextObject? jianshedanweiText,
    TextObject? jianlidanweiText,
    TextObject? shejidanweiText,
    TextObject? kanchadanweiText,
    TextObject? miaoshuText,
    TextObject? dabiaotiText,
    TextObject? xiaobiaotxiText,
  }) {
    return WatermarkUIObject(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      second: second ?? this.second,
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
      gongchengmingchengText: gongchengmingchengText ?? this.gongchengmingchengText,
      shigongdanweiText: shigongdanweiText ?? this.shigongdanweiText,
      xunjianleixingText: xunjianleixingText ?? this.xunjianleixingText,
      xunjianquyuText: xunjianquyuText ?? this.xunjianquyuText,
      xunjianrenText: xunjianrenText ?? this.xunjianrenText,
      zhuchirenText: zhuchirenText ?? this.zhuchirenText,
      suduText: suduText ?? this.suduText,
      tianjiazidingyixiang: tianjiazidingyixiang ?? this.tianjiazidingyixiang,
      bianhaoText: bianhaoText ?? this.bianhaoText,
      haibaText: haibaText ?? this.haibaText,
      shoujihaoText: shoujihaoText ?? this.shoujihaoText,
      IMEIText: IMEIText ?? this.IMEIText,
      jishuText: jishuText ?? this.jishuText,
      jianlizerenrenText: jianlizerenrenText ?? this.jianlizerenrenText,
      jungongdaojishiText: jungongdaojishiText ?? this.jungongdaojishiText,
      jianshedanweiText: jianshedanweiText ?? this.jianshedanweiText,
      jianlidanweiText: jianlidanweiText ?? this.jianlidanweiText,
      shejidanweiText: shejidanweiText ?? this.shejidanweiText,
      kanchadanweiText: kanchadanweiText ?? this.kanchadanweiText,
      miaoshuText: miaoshuText ?? this.miaoshuText,
      dabiaotiText: dabiaotiText ?? this.dabiaotiText,
      xiaobiaotxiText: xiaobiaotxiText ?? this.xiaobiaotxiText,
    );
  }

  WatermarkUIObject setTimeVisible(bool visible) {
    return WatermarkUIObject(
      year: year.copyWith(visible: visible),
      month: month.copyWith(visible: visible),
      day: day.copyWith(visible: visible),
      hour: hour.copyWith(visible: visible),
      minute: minute.copyWith(visible: visible),
      second: second.copyWith(visible: visible),
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
      suduText: suduText ?? suduText,
      tianjiazidingyixiang: tianjiazidingyixiang ?? tianjiazidingyixiang,
      bianhaoText: bianhaoText ?? bianhaoText,
      haibaText: haibaText ?? haibaText,
      shoujihaoText: shoujihaoText ?? shoujihaoText,
      IMEIText: IMEIText ?? IMEIText,
      jishuText: jishuText ?? jishuText,
      jianlizerenrenText: jianlizerenrenText ?? jianlizerenrenText,
      jungongdaojishiText: jungongdaojishiText ?? jungongdaojishiText,
      jianshedanweiText: jianshedanweiText ?? jianshedanweiText,
      jianlidanweiText: jianlidanweiText ?? jianlidanweiText,
      shejidanweiText: shejidanweiText ?? shejidanweiText,
      kanchadanweiText: kanchadanweiText ?? kanchadanweiText,
      miaoshuText: miaoshuText ?? miaoshuText,
      dabiaotiText: dabiaotiText ?? dabiaotiText,
      xiaobiaotxiText: xiaobiaotxiText ?? xiaobiaotxiText,
    );
  }

  WatermarkUIObject updateDateTime(DateTime dateTime) {
    return WatermarkUIObject(
      year: year.copyWith(text: Utils.getFormattedYear(dateTime).toString()),
      month: month.copyWith(text: Utils.getFormattedMonth(dateTime).toString()),
      day: day.copyWith(text: Utils.getFormattedDay(dateTime).toString()),
      hour: hour.copyWith(text: Utils.getFormattedHour(dateTime).toString()),
      minute: minute.copyWith(text: Utils.getFormattedMinute(dateTime).toString()),
      second: second.copyWith(text: Utils.getFormattedSecond(dateTime).toString()),
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
      suduText: suduText ?? suduText,
      tianjiazidingyixiang: tianjiazidingyixiang ?? tianjiazidingyixiang,
      bianhaoText: bianhaoText ?? bianhaoText,
      haibaText: haibaText ?? haibaText,
      shoujihaoText: shoujihaoText ?? shoujihaoText,
      IMEIText: IMEIText ?? IMEIText,
      jishuText: jishuText ?? jishuText,
      jianlizerenrenText: jianlizerenrenText ?? jianlizerenrenText,
      jungongdaojishiText: jungongdaojishiText ?? jungongdaojishiText,
      jianshedanweiText: jianshedanweiText ?? jianshedanweiText,
      jianlidanweiText: jianlidanweiText ?? jianlidanweiText,
      shejidanweiText: shejidanweiText ?? shejidanweiText,
      kanchadanweiText: kanchadanweiText ?? kanchadanweiText,
      miaoshuText: miaoshuText ?? miaoshuText,
      dabiaotiText: dabiaotiText ?? dabiaotiText,
      xiaobiaotxiText: xiaobiaotxiText ?? xiaobiaotxiText,
    );
  }

  WatermarkUIObject setLocationVisible(bool visible) {
    return WatermarkUIObject(
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      second: second,
      week: week,
      location: location?.copyWith(visible: visible),
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

  WatermarkUIObject updateLocation(String location) {
    return WatermarkUIObject(
      year: year,
      month: month,
      day: day,
      hour: hour,
      second: second,
      minute: minute,
      week: week,
      location: this.location?.copyWith(text: location),
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
      suduText: suduText ?? suduText,
      tianjiazidingyixiang: tianjiazidingyixiang ?? tianjiazidingyixiang,
      bianhaoText: bianhaoText ?? bianhaoText,
      haibaText: haibaText ?? haibaText,
      shoujihaoText: shoujihaoText ?? shoujihaoText,
      IMEIText: IMEIText ?? IMEIText,
      jishuText: jishuText ?? jishuText,
      jianlizerenrenText: jianlizerenrenText ?? jianlizerenrenText,
      jungongdaojishiText: jungongdaojishiText ?? jungongdaojishiText,
      jianshedanweiText: jianshedanweiText ?? jianshedanweiText,
      jianlidanweiText: jianlidanweiText ?? jianlidanweiText,
      shejidanweiText: shejidanweiText ?? shejidanweiText,
      kanchadanweiText: kanchadanweiText ?? kanchadanweiText,
      miaoshuText: miaoshuText ?? miaoshuText,
      dabiaotiText: dabiaotiText ?? dabiaotiText,
      xiaobiaotxiText: xiaobiaotxiText ?? xiaobiaotxiText,
    );
  }
}
