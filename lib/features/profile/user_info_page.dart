import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      appBar: AppBar(
        title: const Text('个人资料'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('头像'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to avatar edit page or show avatar options
            },
          ),
          ListTile(
            title: const Text('昵称'),
            subtitle: const Text('请输入昵称'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to nickname edit page
            },
          ),
          // Add more ListTiles for other profile items
        ],
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

