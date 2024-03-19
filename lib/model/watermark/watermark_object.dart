import 'package:cameraApp/model/watermark/image_object.dart';
import 'package:cameraApp/model/watermark/text_object.dart';
import 'package:cameraApp/model/watermark/watermark_data.dart';
import 'package:cameraApp/utils/utils.dart';

class WatermarkUIObject {
  final TextObject year;
  final TextObject month;
  final TextObject day;
  final TextObject hour;
  final TextObject minute;
  final TextObject week;
  final TextObject? location;
  final ImageObject? imageObject;
  final TextObject? customized;
  final TextObject? weather;

  WatermarkUIObject({
    required this.day,
    required this.hour,
    required this.minute,
    required this.year,
    required this.month,
    required this.week,
    required this.location,
    required this.imageObject,
    this.customized,
    this.weather,
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
    );
  }
}
