import 'package:cameraApp/features/camera/camera_provider.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:cameraApp/shared/Widget/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AspectRatioSettingsPage extends ConsumerStatefulWidget {
  @override
  _AspectRatioSettingsPageState createState() =>
      _AspectRatioSettingsPageState();
}

class _AspectRatioSettingsPageState
    extends ConsumerState<AspectRatioSettingsPage> {
  // 定义画幅选项
  final List<Map<String, dynamic>> aspectRatios = [
    {'name': '1:1', 'value': 1.0},
    {'name': '4:3', 'value': 4.0 / 3.0},
    {'name': '16:9', 'value': 16.0 / 9.0},
  ];

  int? selectedAspectRatioIndex;

  @override
  Widget build(BuildContext context) {
    switch (ref.read(cameraProvider).cameraAspectRatio) {
      case CameraAspectRatio.one:
        selectedAspectRatioIndex = 0;
        break;
      case CameraAspectRatio.two:
        selectedAspectRatioIndex = 1;
        break;
      case CameraAspectRatio.three:
        selectedAspectRatioIndex = 2;
        break;
      default:
        selectedAspectRatioIndex = null;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BasicHeader(text: "拍照画幅"),
            Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: aspectRatios.length,
                itemBuilder: (context, index) {
                  final aspectRatio = aspectRatios[index];
                  return Column(
                    children: [
                      SettingDivider(),
                      ListTile(
                        title: Text(aspectRatio['name']!),
                        trailing: selectedAspectRatioIndex == index
                            ? const Icon(Icons.check, color: Colors.blue)
                            : const SizedBox.shrink(),
                        onTap: () {
                          setState(
                            () {
                              selectedAspectRatioIndex = index;
                              CameraAspectRatio ratio;
                              switch (index) {
                                case 0:
                                  ratio = CameraAspectRatio.one;
                                  break;
                                case 1:
                                  ratio = CameraAspectRatio.two;
                                  break;
                                case 2:
                                  ratio = CameraAspectRatio.three;
                                  break;
                                default:
                                  ratio = CameraAspectRatio.two;
                              }
                              ref
                                  .read(cameraProvider.notifier)
                                  .updateAspectRatio(ratio);
                            },
                          );
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
