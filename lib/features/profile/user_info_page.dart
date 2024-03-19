import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:cameraApp/shared/Widget/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return UserInfoPageState();
  }
}

class UserInfoPageState extends ConsumerState<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            BasicHeader(text: "个人资料"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SettingDivider(),
                  ),
                  ListTile(
                    title: const Text('头像'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      /// TODO
                      /// avatar setting
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  ListTile(
                    title: const Text('昵称'),

                    /// TODO nickname
                    subtitle: const Text(''),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.push('/setting/nickname');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Placeholder image URL
          ),
          const SizedBox(height: 10),
          const Text(
            '登录/注册',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {
              // Implement login/registration functionality
            },
            child: const Text('立即登录'),
          ),
        ],
      ),
    );
  }
}
