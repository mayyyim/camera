import 'package:cameraApp/model/watermark/watermark_item.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark1.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark10.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark11.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark111.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark12.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark14.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark15.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark16.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark17.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark18.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark19.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark2.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark20.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark21.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark23.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark24.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark25.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark26.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark28.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark29.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark3.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark30.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark31.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark32.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark33.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark37.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark38.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark4.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark40.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark42.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark45.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark49.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark5.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark53.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark6.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark62.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark65.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark67.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark69.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark7.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark71.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark74.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark78.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark8.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark81.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark82.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark9.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark95.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';

class Constants {
  static String WEATHER_API_KEY = "9c3dd1f2859340f9bde0d5c3f10d1726";
  static String PRIVACY_POLICY_URL = "www.baidu.com";
  static String USER_AGREEMENT_URL = "";
  static List<WatermarkItem> ALL_WATERMARKS = SHIJIANJILU_WATERMARKS +
      XIANCHANG_WATERMARKS +
      DINGDING_WATERMARKS +
      JIANZHU_WATERMARKS +
      XUNJIAN_WATERMARKS +
      WUYE_WATERMARKS;

  static List<WatermarkItem> SHIJIANJILU_WATERMARKS = [
    WatermarkItem(id: "1", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "2", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "4", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "6", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "95", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "16", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "10", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "111", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "18", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "20", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "65", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "33", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "8", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "9", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "69", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "19", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "81", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "78", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "30", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "74", tag: WatermarkTag.shijianjilu),
    WatermarkItem(id: "7", tag: WatermarkTag.shijianjilu),
  ];

  static List<WatermarkItem> XIANCHANG_WATERMARKS = [
    WatermarkItem(id: "3", tag: WatermarkTag.xianchangpaizhao),
    WatermarkItem(id: "14", tag: WatermarkTag.xianchangpaizhao),
    WatermarkItem(id: "24", tag: WatermarkTag.xianchangpaizhao),
    WatermarkItem(id: "25", tag: WatermarkTag.xianchangpaizhao),
    WatermarkItem(id: "26", tag: WatermarkTag.xianchangpaizhao),
    WatermarkItem(id: "11", tag: WatermarkTag.xianchangpaizhao),
    WatermarkItem(id: "28", tag: WatermarkTag.xianchangpaizhao),
    WatermarkItem(id: "21", tag: WatermarkTag.xianchangpaizhao),
    WatermarkItem(id: "82", tag: WatermarkTag.xianchangpaizhao),
  ];

  static List<WatermarkItem> DINGDING_WATERMARKS = [
    WatermarkItem(id: "53", tag: WatermarkTag.dingdingjilu),
    WatermarkItem(id: "16", tag: WatermarkTag.dingdingjilu),
    WatermarkItem(id: "17", tag: WatermarkTag.dingdingjilu),
    WatermarkItem(id: "18", tag: WatermarkTag.dingdingjilu),
    WatermarkItem(id: "19", tag: WatermarkTag.dingdingjilu),
    WatermarkItem(id: "20", tag: WatermarkTag.dingdingjilu),
    WatermarkItem(id: "21", tag: WatermarkTag.dingdingjilu),
  ];

  static List<WatermarkItem> JIANZHU_WATERMARKS = [
    WatermarkItem(id: "29", tag: WatermarkTag.jianzhugongcheng),
    WatermarkItem(id: "5", tag: WatermarkTag.jianzhugongcheng),
    WatermarkItem(id: "15", tag: WatermarkTag.jianzhugongcheng),
    WatermarkItem(id: "37", tag: WatermarkTag.jianzhugongcheng),
    WatermarkItem(id: "40", tag: WatermarkTag.jianzhugongcheng),
    WatermarkItem(id: "32", tag: WatermarkTag.jianzhugongcheng),
    WatermarkItem(id: "23", tag: WatermarkTag.jianzhugongcheng),
  ];

  static List<WatermarkItem> XUNJIAN_WATERMARKS = [
    WatermarkItem(id: "17", tag: WatermarkTag.xunjianweixiu),
    WatermarkItem(id: "45", tag: WatermarkTag.xunjianweixiu),
    WatermarkItem(id: "42", tag: WatermarkTag.xunjianweixiu),
    WatermarkItem(id: "38", tag: WatermarkTag.xunjianweixiu),
    WatermarkItem(id: "62", tag: WatermarkTag.xunjianweixiu),
    WatermarkItem(id: "67", tag: WatermarkTag.xunjianweixiu),
  ];

  static List<WatermarkItem> WUYE_WATERMARKS = [
    WatermarkItem(id: "31", tag: WatermarkTag.wuyeguanli),
    WatermarkItem(id: "49", tag: WatermarkTag.wuyeguanli),
    WatermarkItem(id: "12", tag: WatermarkTag.wuyeguanli),
    WatermarkItem(id: "71", tag: WatermarkTag.wuyeguanli),
  ];

  static List<List<WatermarkItem>> WATERMARKS_LISTS = [
    ALL_WATERMARKS,
    XIANCHANG_WATERMARKS,
    SHIJIANJILU_WATERMARKS,
    DINGDING_WATERMARKS,
    JIANZHU_WATERMARKS,
    XUNJIAN_WATERMARKS,
    WUYE_WATERMARKS,
  ];

  static List<List<WaterMarkWidget>> WATERMARKS_WIDGETS_LISTS = [
    ALL_WATERMARKS_WIDGETS,
    XIANCHANG_WATERMARKS_WIDGETS,
    SHIJIANJILU_WATERMARKS_WIDGETS,
    DINGDING_WATERMARKS_WIDGETS,
    JIANZHU_WATERMARKS_WIDGETS,
    XUNJIAN_WATERMARKS_WIDGETS,
    WUYE_WATERMARKS_WIDGETS,
  ];
  static List<WaterMarkWidget> ALL_WATERMARKS_WIDGETS =
      SHIJIANJILU_WATERMARKS_WIDGETS +
          XIANCHANG_WATERMARKS_WIDGETS +
          DINGDING_WATERMARKS_WIDGETS +
          JIANZHU_WATERMARKS_WIDGETS +
          XUNJIAN_WATERMARKS_WIDGETS +
          WUYE_WATERMARKS_WIDGETS;

  static List<WaterMarkWidget> SHIJIANJILU_WATERMARKS_WIDGETS = [
    Watermark1.defaultData(),
    Watermark2.defaultData(),
    Watermark4.defaultData(),
    Watermark6.defaultData(),
    Watermark95.defaultData(),
    Watermark16.defaultData(),
    Watermark10.defaultData(),
    Watermark111.defaultData(),
    Watermark18.defaultData(),
    Watermark20.defaultData(),
    Watermark65.defaultData(),
    Watermark33.defaultData(),
    Watermark8.defaultData(),
    Watermark9.defaultData(),
    Watermark69.defaultData(),
    Watermark19.defaultData(),
    Watermark81.defaultData(),
    Watermark78.defaultData(),
    Watermark30.defaultData(),
    Watermark74.defaultData(),
    Watermark7.defaultData(),
  ];

  static List<WaterMarkWidget> XIANCHANG_WATERMARKS_WIDGETS = [
    Watermark3.defaultData(),
    Watermark14.defaultData(),
    Watermark24.defaultData(),
    Watermark25.defaultData(),
    Watermark26.defaultData(),
    Watermark11.defaultData(),
    Watermark28.defaultData(),
    Watermark21.defaultData(),
    Watermark82.defaultData(),
  ];
  static List<WaterMarkWidget> DINGDING_WATERMARKS_WIDGETS = [
    Watermark53.defaultData(),
    Watermark16.defaultData(),
    Watermark17.defaultData(),
    Watermark18.defaultData(),
    Watermark19.defaultData(),
    Watermark20.defaultData(),
    Watermark21.defaultData(),
  ];
  static List<WaterMarkWidget> JIANZHU_WATERMARKS_WIDGETS = [
    Watermark29.defaultData(),
    Watermark5.defaultData(),
    Watermark15.defaultData(),
    Watermark37.defaultData(),
    Watermark40.defaultData(),
    Watermark32.defaultData(),
    Watermark23.defaultData(),
  ];
  static List<WaterMarkWidget> XUNJIAN_WATERMARKS_WIDGETS = [
    Watermark17.defaultData(),
    Watermark45.defaultData(),
    Watermark42.defaultData(),
    Watermark38.defaultData(),
    Watermark62.defaultData(),
    Watermark67.defaultData(),
  ];
  static List<WaterMarkWidget> WUYE_WATERMARKS_WIDGETS = [
    Watermark31.defaultData(),
    Watermark49.defaultData(),
    Watermark12.defaultData(),
    Watermark71.defaultData(),
  ];

  static Map<String, String> VIP_FUNCTIONS = {
    "assets/icon/quchu.png": "去除VIP标签",
    "assets/icon/genggaishijian.png": "更改时间",
    "assets/icon/genggaiweizhi.png": "更改位置",
    "assets/icon/genggaijingweidu.png": "更改经纬度",
    "assets/icon/daka.png": "打卡考勤",
    "assets/icon/youxiajiaoshuiyin.png": "右下角水印",
    "assets/icon/shuiyinmoban.png": "水印模版",
    "assets/icon/xiangceshuiyin.png": "相册水印",
    "assets/icon/shipinshuiyin.png": "视频水印",
    "assets/icon/tiaozhengdaxiao.png": "调整大小",
    "assets/icon/shoucangshuiyin.png": "收藏水印",
    "assets/icon/zhuanshukefu.png": "专属客服",
  };
}
