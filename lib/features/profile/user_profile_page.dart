import 'package:cameraApp/features/profile/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return UserProfileScreenState();
  }
}

class UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  late bool isLoggedIn;
  late String? username;
  late String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    isLoggedIn = ref.read(userProvider).isLoggedIn;
    username = ref.read(userProvider).username;
    avatarUrl = ref.read(userProvider).avatarUrl;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            SizedBox(
              height: 600,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 20),
                  _buildUserInfo(context),
                  const SizedBox(height: 20),
                  buildVip(),
                  const SizedBox(height: 20),
                  ListTile(
                    title: const Text('卡密激活'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // 卡密激活逻辑
                    },
                  ),
                  ListTile(
                    title: const Text('用户协议'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // 用户协议逻辑
                    },
                  ),
                  ListTile(
                    title: const Text('隐私政策'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // 隐私政策逻辑
                    },
                  ),
                  ListTile(
                    title: const Text('软件条款'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // 软件条款逻辑
                    },
                  ),
                  ListTile(
                    title: const Text('新版本体验'),
                    subtitle: const Text('V1.0.0'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // 新版本体验逻辑
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

  Widget _buildUserInfo(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.push('/user/info');
        },
        child: isLoggedIn
            ? ListTile(
                leading: avatarUrl != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl!),
                      )
                    : const CircleAvatar(child: Icon(Icons.person)),
                title: Text(username ?? '用户名'),
                subtitle: const Text('查看或编辑个人资料'),
              )
            : Row(children: const [
                SizedBox(width: 20),
                CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person_outline,
                    size: 40,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '登录/注册',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ]));
  }

  Widget buildVip() {
    /// TODO vip
    return Container();
  }

  Widget buildHeader() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          IconButton(
              onPressed: () {
                /// TODO
                /// share
              },
              icon: const Icon(Icons.share)),
        ],
      ),
    );
  }
}
