// 定义水印对象
class Watermark {
  final DateTime time;
  final String location;
  final String? imageUrl;

  Watermark({
    required this.time,
    required this.location,
    this.imageUrl,
  });
}
