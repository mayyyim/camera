import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class PositionService {
  static late String latitude = "";
  static late String longitude = "";

  static Future<Position?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // 检查位置服务是否启用
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 位置服务未启用，无法获取位置
      return null;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 权限被拒绝
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // 权限被永久拒绝，我们无法请求权限
      return null;
    }
    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    getAddressFromLatLong();
    return position;
  }

  static Future<String?> getAddressFromLatLong() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          double.parse(latitude), double.parse(longitude));

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;

        var city = placemark.locality; // City
        var district =
            placemark.subAdministrativeArea; // District or sub-locality
        return "$city $district";
      }
    } on Exception catch (e) {
      print('An error occurred while getting address: $e');
    }
  }

  static Future<String> getWeather() async {
    return "晴";
  }
}
