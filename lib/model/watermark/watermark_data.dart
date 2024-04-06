import 'package:geolocator/geolocator.dart';

class WatermarkData {
  final DateTime dateTime;
  final String? position;
  final String? weather;
  final String? imageUrl;
  final String? customized;
  final String? dakabiaotiText;
  final String? beizhuText;
  final String? shijianyanzhengText;
  final String? gongchengmingchengText;
  final String? shigongdanweiText;
  final String? xunjianrenText;
  final String? xunjianleixingText;
  final String? xunjianquyuText;
  final String? zhuchirenText;

  WatermarkData({
    required this.dateTime,
    required this.position,
    required this.weather,
    this.imageUrl,
    this.customized = "备注",
    this.dakabiaotiText = '',
    this.beizhuText = '',
    this.shijianyanzhengText = "定制水印时间相机已验证考勤信息的真实性",
    this.gongchengmingchengText = '工程名称',
    this.shigongdanweiText = '施工单位',
    this.xunjianrenText = "巡检人",
    this.xunjianleixingText = "巡检类型",
    this.xunjianquyuText = "巡检区域",
    this.zhuchirenText = "主持人",
  });

  WatermarkData copyWith({
    DateTime? dateTime,
    String? position,
    String? weather,
    String? imageUrl,
    String? customized,
    String? dakabiaotiText,
    String? beizhuText,
    String? shijianyanzhengText,
    String? gongchengmingchengText,
    String? shigongdanweiText,
    String? xunjianrenText,
    String? xunjianleixingText,
    String? xunjianquyuText,
    String? zhuchirenText,
  }) {
    return WatermarkData(
      dateTime: dateTime ?? this.dateTime,
      position: position ?? this.position,
      weather: weather ?? this.weather,
      imageUrl: imageUrl ?? this.imageUrl,
      customized: customized ?? this.customized,
      dakabiaotiText: dakabiaotiText ?? this.dakabiaotiText,
      beizhuText: beizhuText ?? this.beizhuText,
      shijianyanzhengText: shijianyanzhengText ?? this.shijianyanzhengText,
      gongchengmingchengText:
          gongchengmingchengText ?? this.gongchengmingchengText,
      shigongdanweiText: shigongdanweiText ?? this.shigongdanweiText,
      xunjianleixingText: xunjianleixingText ?? this.xunjianleixingText,
      xunjianrenText: xunjianrenText ?? this.xunjianrenText,
      xunjianquyuText: xunjianquyuText ?? this.xunjianquyuText,
      zhuchirenText: zhuchirenText ?? this.zhuchirenText,
    );
  }
}
