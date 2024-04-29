import 'package:cameraApp/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PositionService {
  static late String latitude = "";
  static late String longitude = "";

  static Future<String?> getLocation() async {
    print("MJ: test get location");
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      openLocationSettings();
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
    print("MJ: test position is $position");
    return getAddressFromLatLong();
  }

  static Future<String?> getDefaultLocation() async {
    return "位置信息正在获取中";
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

  static Future<String> getDefaultWeather() async {
    return "天气获取中";
  }

  static Future<String> getWeather() async {
    String locationID = await getLocationId();
    final response = await http.get(Uri.parse(
        'https://devapi.qweather.com/v7/weather/3d?location=$locationID&key=${Constants.WEATHER_API_KEY}'));

    if (response.statusCode == 200) {
      return (json.decode(response.body))["daily"][0]['textDay'].toString();
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  static Future<String> getLocationId() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final latitude = position.latitude;
    final longitude = position.longitude;
    final String url =
        'https://geoapi.qweather.com/v2/city/lookup?location=${latitude},${longitude}&key=${Constants.WEATHER_API_KEY}';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return (json.decode(response.body))["code"].toString();
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  static void openLocationSettings() async {
    const url = 'app-settings:';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
