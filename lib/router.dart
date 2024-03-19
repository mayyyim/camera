import 'package:cameraApp/features/basic_setting/basic_setting_page.dart';
import 'package:cameraApp/features/basic_setting/camera/clarity_setting_page.dart';
import 'package:cameraApp/features/basic_setting/camera/delay_setting_page.dart';
import 'package:cameraApp/features/basic_setting/camera/huafu_setting_page.dart';
import 'package:cameraApp/features/basic_setting/camera_setting_page.dart';
import 'package:cameraApp/features/camera/camera_page.dart';
import 'package:cameraApp/features/photo/photo_edit_page.dart';
import 'package:cameraApp/features/profile/nickname_edit_page.dart';
import 'package:cameraApp/features/profile/user_info_page.dart';
import 'package:cameraApp/features/profile/user_profile_page.dart';
import 'package:cameraApp/features/settting/card_activation.dart';
import 'package:cameraApp/features/settting/privacy_page.dart';
import 'package:cameraApp/features/settting/software_page.dart';
import 'package:cameraApp/features/settting/term_page.dart';
import 'package:cameraApp/features/settting/video_guide.dart';
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
            path: '/setting/ratio',
            builder: (context, state) => AspectRatioSettingsPage()),
        GoRoute(
            path: '/setting/clarity',
            builder: (context, state) => ClaritySettingsPage()),
        GoRoute(
            path: '/setting/delay',
            builder: (context, state) => DelaySettingsPage()),
        GoRoute(
            path: '/setting/camera',
            builder: (context, state) => CameraSettingsScreen()),
        GoRoute(
            path: '/setting/privacy',
            builder: (context, state) => PrivacyPage()),
        GoRoute(path: '/setting/term', builder: (context, state) => TermPage()),
        GoRoute(
            path: '/setting/software',
            builder: (context, state) => SoftwarePage()),
        GoRoute(
            path: '/setting/activation',
            builder: (context, state) => ActivationPage()),
        GoRoute(
            path: '/setting/guide',
            builder: (context, state) => VideoGuidePage()),
        GoRoute(
            path: '/setting/nickname',
            builder: (context, state) => const NicknameEditPage()),
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
