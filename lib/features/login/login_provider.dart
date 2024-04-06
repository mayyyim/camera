import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);

// 定义登录状态
class LoginState {
  final bool isLoggedIn;
  final String? phoneNumber;
  final String? verificationCode;

  LoginState({
    this.isLoggedIn = false,
    this.phoneNumber,
    this.verificationCode,
  });

  // 复制LoginState的实例，以便在不改变当前实例的情况下更新状态
  LoginState copyWith({
    bool? isLoggedIn,
    String? phoneNumber,
    String? verificationCode,
  }) {
    return LoginState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationCode: verificationCode ?? this.verificationCode,
    );
  }
}

// 管理登录状态的StateNotifier
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  void setPhoneNumber(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void setVerificationCode(String verificationCode) {
    state = state.copyWith(verificationCode: verificationCode);
  }

  Future<void> requestCode() async {
    final phoneNumber = state.phoneNumber;
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return;
    }
    try {
      /// TODO  获取验证码
      final code = "";
      state = state.copyWith(verificationCode: code);
    } catch (e) {
      // 处理发送验证码时发生的任何错误
    }
  }

  // 验证输入的验证码
  Future<void> validateCode(String inputCode) async {
    final actualCode = state.verificationCode;
    if (actualCode == inputCode) {
      ///  TODO  validation
      state = state.copyWith(isLoggedIn: true);
    } else {
      // 验证码错误
      // 处理验证失败逻辑
    }
  }

  // 执行登录操作
  Future<void> login() async {
    final phoneNumber = state.phoneNumber;
    final verificationCode = state.verificationCode;
    if (phoneNumber != null && verificationCode != null) {
      try {
        // 模拟登录请求
       /// TODO login
        state = state.copyWith(isLoggedIn: true);
      } catch (e) {
        // 处理登录时发生的任何错误
      }
    }
  }

  // 退出登录
  void logout() {
    state = LoginState(isLoggedIn: false);
  }
}
