import 'package:cameraApp/features/camera/camera_provider.dart';
import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:cameraApp/shared/Widget/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BasicSettingPage extends ConsumerStatefulWidget {
  const BasicSettingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return BasicSettingPageState();
  }
}

class BasicSettingPageState extends ConsumerState<BasicSettingPage> {
  @override
  Widget build(BuildContext context) {
    String ratio = '';
    switch (ref.read(cameraProvider).cameraAspectRatio) {
      case CameraAspectRatio.one:
        ratio = "1:1";
        break;
      case CameraAspectRatio.two:
        ratio = "4:3";
        break;
      case CameraAspectRatio.three:
        ratio = "16:9";
        break;
      default:
        ratio = "";
        break;
    }

    String delay = '';
    switch (ref.read(cameraProvider).delayInSecond) {
      case 0:
        delay = "无延时";
        break;
      default:
        delay = "${ref.read(cameraProvider).delayInSecond}s";
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BasicHeader(text: "拍照设置"),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SettingDivider(),
          ),
          ListTile(
            title: const Text('拍照画幅'),
            subtitle: Text(ratio),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.push("/setting/ratio");
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: SettingDivider(),
          ),
          ListTile(
            title: const Text('延时拍摄'),
            subtitle: Text(delay),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.push("/setting/delay");
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: SettingDivider(),
          ),
          ListTile(
            title: const Text('相机设置'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.push('/setting/camera');
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: SettingDivider(),
          ),
          SwitchListTile(
            title: const Text('水印开关'),
            value: ref
                .watch(watermarkEditProvider)
                .showWatermark, // 开关状态，应根据实际情况动态设置
            onChanged: (bool value) {
              ref
                  .read(watermarkEditProvider.notifier)
                  .updateShowWatermark(value);
            },
          ),
        ],
      )),
    );
  }
}
