import 'package:cameraApp/features/basic_setting/basic_setting_page.dart';
import 'package:cameraApp/features/basic_setting/camera_setting_page.dart';
import 'package:cameraApp/features/camera/camera_page.dart';
import 'package:cameraApp/features/photo/photo_edit_page.dart';
import 'package:cameraApp/features/profile/user_info_page.dart';
import 'package:cameraApp/features/profile/user_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class CameraRouter {
  static GoRouter? _router;

  /// A flag which refers to whether the package is initialized (whether [_context] is set).
  static bool get initialized => _router != null;

  /// The get method of the stored global context.
  ///
  /// Throws a [GlobalApplicationError] when the package is not initialized.
  static GoRouter get router {
    if (initialized) {
      return _router!;
    } else {
      throw Exception(["Please check Router"]);
    }
  }

  static init(
      {required GlobalKey<NavigatorState>? navigatorKey, bool? isLogin}) {
    if (initialized) {
      return;
    }
    _router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: isLogin ?? true ? '/camera' : '/login',
      // initialLocation: '/splash',
      routes: [
        GoRoute(path: '/camera', builder: (context, state) => CameraPage()),
        GoRoute(
            path: '/photo/edit',
            builder: (context, state) => const PhotoEditPage()),
        GoRoute(
            path: '/user', builder: (context, state) => UserProfileScreen()),
        GoRoute(
            path: '/user/info',
            builder: (context, state) => const UserInfoPage()),
        GoRoute(
            path: '/setting',
            builder: (context, state) => const BasicSettingPage()),
        GoRoute(
            path: '/setting/camera',
            builder: (context, state) => CameraSettingsScreen()),
      ],

      redirect: (context, state) async {
        if (state.location == '/') {
          return '/camera';
        }
        return null;
      },
    );
  }
}
