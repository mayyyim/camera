import 'package:flutter/cupertino.dart';

class WatermarkItem {
  final String id;
  final WatermarkTag tag;

  WatermarkItem({
    required this.id,
    required this.tag,
  });

  WatermarkItem copyWith(String? id) {
    return WatermarkItem(id: id ?? this.id, tag: tag);
  }
}

enum WatermarkTag {
  xianchangpaizhao,
  shijianjilu,
  dingdingjilu,
  jianzhugongcheng,
  xunjianweixiu,
  wuyeguanli,
}
