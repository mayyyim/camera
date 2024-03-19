import 'package:cameraApp/features/camera/camera_provider.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:cameraApp/shared/Widget/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClaritySettingsPage extends ConsumerStatefulWidget {
  @override
  _ClaritySettingsPageState createState() => _ClaritySettingsPageState();
}

class _ClaritySettingsPageState extends ConsumerState<ClaritySettingsPage> {
  // 定义画幅选项
  final List<Map<String, dynamic>> clarity = [
    {'name': '480p', 'value': '480p'},
    {'name': '720p', 'value': '720p'},
    {'name': '1080p', 'value': '1080p'},
  ];

  int? selectedClarityIndex;

  @override
  Widget build(BuildContext context) {
    switch (ref.read(cameraProvider).clarity) {
      case '480p':
        selectedClarityIndex = 0;
        break;
      case '720p':
        selectedClarityIndex = 1;
        break;
      case '1080p':
        selectedClarityIndex = 2;
        break;
      default:
        selectedClarityIndex = 0;
        break;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BasicHeader(text: "视频清晰度"),
            Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: clarity.length,
                itemBuilder: (context, index) {
                  final item = clarity[index];
                  return Column(
                    children: [
                      SettingDivider(),
                      ListTile(
                        title: Text(item['name']!),
                        trailing: selectedClarityIndex == index
                            ? const Icon(Icons.check, color: Colors.blue)
                            : const SizedBox.shrink(),
                        onTap: () {
                          setState(() {
                            selectedClarityIndex = index;
                            ref
                                .read(cameraProvider.notifier)
                                .updateVideoClarity(item['value']);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
