import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState {
  final bool isLoggedIn;
  final String? username;
  final String? avatarUrl;

  UserState({required this.isLoggedIn, this.username, this.avatarUrl});

  UserState copyWith({
    bool? isLoggedIn,
    String? username,
    String? avatarUrl,
  }) {
    return UserState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState(isLoggedIn: false));

  void login(String username, String avatarUrl) {
    state = state.copyWith(
      isLoggedIn: true,
      username: username,
      avatarUrl: avatarUrl,
    );
  }

  void logout() {
    state = state.copyWith(
      isLoggedIn: false,
      username: null,
      avatarUrl: null,
    );
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
