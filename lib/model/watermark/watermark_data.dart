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
  final String? suduText; //速度
  final String? tianjiazidingyixiang; //添加自定义项
  final String? bianhaoText; //编号
  final String? haibaText; //海拔
  final String? shoujihaoText; //手机号
  final String? IMEIText; //IMEI
  final String? jishuText; //计数
  final String? jianlizerenrenText; // 监理责任人
  final DateTime? jungongdaojishiText; // 竣工倒计时
  final String? jianshedanweiText; //建设单位
  final String? jianlidanweiText; //监理单位
  final String? shejidanweiText; //设计单位
  final String? kanchadanweiText; //勘察单位
  final String? miaoshuText; // 描述
  final String? dabiaotiText; //大标题
  final String? xiaobiaotiText; // 小标题

  WatermarkData(
      {required this.dateTime,
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
      this.suduText = "test",
      this.tianjiazidingyixiang = "",
      this.bianhaoText = "test",
      this.haibaText = "test",
      this.shoujihaoText = "test",
      this.IMEIText = "test",
      this.jishuText = "test",
      this.jianlizerenrenText = "test",
      this.jungongdaojishiText,
      this.jianshedanweiText = "test",
      this.jianlidanweiText = "test",
      this.shejidanweiText = "test",
      this.kanchadanweiText = "test",
      this.miaoshuText = "test",
      this.dabiaotiText = "test",
      this.xiaobiaotiText = "test"});

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
    String? suduText, //速度
    String? tianjiazidingyixiang, //添加自定义项
    String? bianhaoText, //编号
    String? haibaText, //海拔
    String? shoujihaoText, //手机号
    String? IMEIText, //IMEI
    String? jishuText, //计数
    String? jianlizerenrenText, // 监理责任人
    DateTime? jungongdaojishiText, // 竣工倒计时
    String? jianshedanweiText, //建设单位
    String? jianlidanweiText, //监理单位
    String? shejidanweiText, //设计单位
    String? kanchadanweiText, //勘察单位
    String? miaoshuText, // 描述
    String? dabiaotiText, //大标题
    String? xiaobiaotiText, // 小标题
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
      gongchengmingchengText: gongchengmingchengText ?? this.gongchengmingchengText,
      shigongdanweiText: shigongdanweiText ?? this.shigongdanweiText,
      xunjianleixingText: xunjianleixingText ?? this.xunjianleixingText,
      xunjianrenText: xunjianrenText ?? this.xunjianrenText,
      xunjianquyuText: xunjianquyuText ?? this.xunjianquyuText,
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
      dabiaotiText: dabiaotiText ?? this.dakabiaotiText,
      xiaobiaotiText: xiaobiaotiText ?? this.xiaobiaotiText,
    );
  }
}
