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
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: const Text('拍照间隔'),
              subtitle: const Text('4:3'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // 导航到拍照间隔设置页面
              },
            ),
            ListTile(
              title: const Text('延时拍摄'),
              subtitle: const Text('无延时'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // 导航到延时拍摄设置页面
              },
            ),
            ListTile(
              title: const Text('相机设置'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/setting/camera');
              },
            ),
            SwitchListTile(
              title: const Text('水印开关'),
              value: true, // 开关状态，应根据实际情况动态设置
              onChanged: (bool value) {
                // 处理开关切换逻辑
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}
