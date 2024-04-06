import 'package:cameraApp/router.dart';
import 'package:cameraApp/shared/data/data.dart';
import 'package:cameraApp/shared/provider/preference.dart';
import 'package:cameraApp/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  CameraRouter.init(navigatorKey: navigatorKey);
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: MyApp(),
    ),
  );
  Future.delayed(Duration(seconds: 0)).then((_) {
    MyApp.appStartupConfig();
  });
}

class MyApp extends ConsumerStatefulWidget {
  // This widget is the root of your application.

  static Future<void> appStartupConfig() async {
    await GlobalData.init();
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routerConfig: CameraRouter.router,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // 如果你支持其他语言，也需要添加对应的delegate
      ],
      supportedLocales: [
        const Locale('en', ''), // 英文
        const Locale('es', ''), // 西班牙文
        // 其他支持的语言区域
      ],
    );
  }
}
