import 'package:cameraApp/constants.dart';
import 'package:cameraApp/features/login/login_provider.dart';
import 'package:cameraApp/shared/Widget/divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends ConsumerState<LoginPage> {
  bool isSwitched = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      ref
          .read(loginProvider.notifier)
          .setPhoneNumber(_phoneController.value.text);
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "手机号登录/注册",
                    style: TextStyle(fontSize: 28),
                  )),
              const Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    '首次登录手机号将在验证码登录后注册新账号',
                    style: TextStyle(fontSize: 12),
                  )),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: '请输入手机号',
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.person_outline),
                  suffixIcon: ElevatedButton(
                    onPressed: () {
                      /// TODO
                      /// 获取验证码
                      ref.read(loginProvider.notifier).requestCode();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Text('获取验证码'),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SettingDivider(),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(
                  hintText: '请输入验证码',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                keyboardType: TextInputType.number,
              ),
              const SettingDivider(),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(loginProvider.notifier)
                        .validateCode(_codeController.value.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: const Size(double.infinity,
                        50), // double.infinity is the width and 50 is the height
                  ),
                  child: const Text('登录'),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: isSwitched,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          isSwitched = value;
                        });
                      }
                    },
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        const TextSpan(
                            text: '我已阅读并同意',
                            style: TextStyle(
                                fontSize: 11, color: Color(0xFFB8B9BA))),
                        TextSpan(
                          text: '《用户服务协议》',
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrlString('YOUR_USER_AGREEMENT_URL');
                            },
                        ),
                        const TextSpan(
                            text: '和',
                            style: TextStyle(
                                fontSize: 11, color: Color(0xFFB8B9BA))),
                        TextSpan(
                          text: '《隐私政策》',
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launchUrlString('YOUR_PRIVACY_POLICY_URL');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: const Text('其他登录方式',
                    style: TextStyle(fontSize: 11, color: Color(0xFFB8B9BA))),
              ),
              const SizedBox(height: 8),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      /// TODO
                      /// wechat login
                    },
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: const BoxDecoration(
                          color: Color(0xFF28C445),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: const Icon(
                        Icons.wechat,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isSwitched,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          isSwitched = value;
                        });
                      }
                    },
                  ),
                  const Text(
                    '登录即表示同意用户协议和隐私政策',
                    style: TextStyle(color: Color(0xFFB8B9BA), fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
