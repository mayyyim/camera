
class WatermarkItem {
  final String id;
  final WatermarkTag tag;
  final bool isLiked;

  WatermarkItem({required this.id, required this.tag, this.isLiked = false});

  WatermarkItem copyWith({String? id, bool? isLiked}) {
    return WatermarkItem(
        id: id ?? this.id, tag: tag, isLiked: isLiked ?? this.isLiked);
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
