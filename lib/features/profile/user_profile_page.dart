import 'package:cameraApp/features/login/login_provider.dart';
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
    isLoggedIn = ref.read(loginProvider).isLoggedIn;
    username = ref.read(userProvider).username;
    avatarUrl = ref.read(userProvider).avatarUrl;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 640,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _header(context),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: const Text('卡密激活'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.push('/setting/activation');
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: const Text('用户协议'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.push('/setting/term');
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: const Text('隐私政策'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.push('/setting/privacy');
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: const Text('软件条款'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.push('/setting/software');
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: SettingDivider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: const Text('新版本体验'),
                      subtitle: const Text('V1.0.0'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        /// TODO
                        /// 新版本
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            isLoggedIn
                ? BasicButton(
                    text: "退出登录",
                    onTap: () {
                      /// TODO
                      /// logout
                    },
                    backgroundColor: const Color(0xFFF5F7FA),
                    textColor: const Color(0xFFD53333),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(color: Color(0xFFE0E5F8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildHeader(),
                const SizedBox(
                  height: 20,
                ),
                _buildUserInfo(context),
              ],
            ),
          ),
          Positioned(bottom: 0, left: 20, child: buildVip()),
        ],
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
                    : const CircleAvatar(
                        child: Icon(Icons.person),
                        backgroundColor: Color(0xFF87CEFA),
                      ),
                title: Text(username ?? '用户名'),
                subtitle: const Text('查看或编辑个人资料'),
              )
            : Row(children: [
                const SizedBox(width: 20),
                const CircleAvatar(
                  backgroundColor: Color(0xFF87CEFA),
                  radius: 40,
                  child: Icon(
                    Icons.person_outline,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    context.push("/login");
                  },
                  child: const Text(
                    '登录/注册',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
              ]));
  }

  Widget buildVip() {
    return GestureDetector(
      onTap: () {
        /// TODO
        /// navigate to vip
        context.push("/vip");
      },
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width - 40,
          child: Image.asset("assets/image/vip.png")),
    );
  }

  Widget buildHeader() {
    return Container(
      decoration: const BoxDecoration(color: Color(0x11B0E0E6)),
      child: BasicHeader(
        text: '',
        backgroundColor: Colors.transparent,
        widget: const Icon(Icons.share),
        onWidgetTap: () {
          /// TODO
          /// share
        },
      ),
    );
  }
}
