import 'package:cameraApp/features/profile/user_profile_provider.dart';
import 'package:cameraApp/shared/Widget/basic_button.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:cameraApp/shared/Widget/divider.dart';
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
      backgroundColor: Colors.white,
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
                      context.push('/setting/activation');
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  ListTile(
                    title: const Text('用户协议'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.push('/setting/term');
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  ListTile(
                    title: const Text('隐私政策'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.push('/setting/privacy');
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  ListTile(
                    title: const Text('软件条款'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.push('/setting/software');
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  ListTile(
                    title: const Text('新版本体验'),
                    subtitle: const Text('V1.0.0'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      /// TODO
                      /// 新版本
                    },
                  ),
                ],
              ),
            ),
            /// TODO
            /// 判断是否登录
            BasicButton(
              text: "退出登录",
              onTap: () {
                /// TODO
                /// logout
              },
              backgroundColor: Color(0xFFF5F7FA),
              textColor: Colors.red,
            )
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
    return BasicHeader(
      text: '',
      widget: const Icon(Icons.share),
      onWidgetTap: () {
        /// TODO
        /// share
      },
    );
  }
}
