import 'package:geolocator/geolocator.dart';

class WatermarkData {
  final DateTime dateTime;
  final Position? position;
  final String? weather;
  final String? imageUrl;
  final String? customized;

  WatermarkData(
      {required this.dateTime,
      required this.position,
      this.weather,
      this.imageUrl,
      this.customized});

  WatermarkData copyWith({
    DateTime? dateTime,
    Position? position,
    String? weather,
    String? imageUrl,
    String? customized,
  }) {
    return WatermarkData(
      dateTime: dateTime ?? this.dateTime,
      position: position ?? this.position,
      weather: weather ?? this.weather,
      imageUrl: imageUrl ?? this.imageUrl,
      customized: customized ?? this.customized,
    );
  }
}
