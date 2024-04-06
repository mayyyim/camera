import 'package:cameraApp/features/camera/camera_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraModeSwitch extends ConsumerWidget {
  const CameraModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraMode = ref.watch(cameraProvider).cameraMode;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildModeOption(
          context,
          title: '拍照',
          isActive: cameraMode == CameraMode.photo,
          onTap: () =>
              ref.read(cameraProvider.notifier).toggleMode(CameraMode.photo),
        ),
        const SizedBox(width: 24),
        _buildModeOption(
          context,
          title: '视频',
          isActive: cameraMode == CameraMode.video,
          onTap: () =>
              ref.read(cameraProvider.notifier).toggleMode(CameraMode.video),
        ),
      ],
    );
  }

  Widget _buildModeOption(BuildContext context,
      {required String title,
      required bool isActive,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.grey,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(Icons.linear_scale_outlined,
                size: 8, color: isActive ? Colors.black : Colors.transparent),
          ),
        ],
      ),
    );
  }
}
