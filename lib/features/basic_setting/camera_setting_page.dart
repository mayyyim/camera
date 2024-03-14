import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraSettingsScreen extends ConsumerStatefulWidget {
  @override
  _CameraSettingsScreenState createState() => _CameraSettingsScreenState();
}

class _CameraSettingsScreenState extends ConsumerState<CameraSettingsScreen> {
  // 假设的状态变量，用于追踪当前的设置
  bool isGridEnabled = false; // 是否启用网格
  String selectedResolution = '1080P'; // 选择的分辨率
  String selectedAspectRatio = '1920x1440'; // 选择的长宽比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('相机设置'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('视频清晰度'),
            subtitle: Text(selectedResolution),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 导航到清晰度设置页面
            },
          ),
          ListTile(
            title: const Text('拍照分辨率'),
            subtitle: Text(selectedAspectRatio),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // 导航到分辨率设置页面
            },
          ),
          SwitchListTile(
            title: const Text('白板模式'),
            value: isGridEnabled,
            onChanged: (bool value) {
              // 更新网格设置的状态
              setState(() {
                isGridEnabled = value;
              });
              // 进行更多处理，如保存到设置
            },
          ),
        ],
      ),
    );
  }
}
