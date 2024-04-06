import 'package:cameraApp/features/camera/camera_provider.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:cameraApp/shared/Widget/divider.dart';
import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DelaySettingsPage extends ConsumerStatefulWidget {
  @override
  _DelaySettingsPageState createState() => _DelaySettingsPageState();
}

class _DelaySettingsPageState extends ConsumerState<DelaySettingsPage> {
  final List<Map<String, dynamic>> delay = [
    {'name': '无延时', 'value': 0},
    {'name': '3s', 'value': 3},
    {'name': '10s', 'value': 10},
  ];

  int? selectedDelayIndex;

  @override
  Widget build(BuildContext context) {
    switch (ref.read(cameraProvider).delayInSecond) {
      case 0:
        selectedDelayIndex = 0;
        break;
      case 3:
        selectedDelayIndex = 1;
        break;
      case 10:
        selectedDelayIndex = 2;
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BasicHeader(text: "延时设置"),
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: delay.length,
                itemBuilder: (context, index) {
                  final item = delay[index];
                  return Column(
                    children: [
                      const SettingDivider(),
                      ListTile(
                        title: Text(item['name']!),
                        trailing: selectedDelayIndex == index
                            ? const Icon(Icons.check, color: Colors.blue)
                            : const SizedBox.shrink(),
                        onTap: () {
                          setState(() {
                            selectedDelayIndex = index;
                            ref
                                .read(cameraProvider.notifier)
                                .updateDelay(item['value']);
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
