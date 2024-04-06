import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vipProvider = StateNotifierProvider<VipNotifier, VipState>(
      (ref) => VipNotifier(),
);

class VipState {
  final bool isWechatPay;

  VipState({this.isWechatPay = true});

  VipState copyWith({bool? isWechatPay}) {
    return VipState(isWechatPay: isWechatPay ?? this.isWechatPay);
  }
}

class VipNotifier extends StateNotifier<VipState> {
  VipNotifier() : super(VipState());


  // 设置支付方式的方法
  void updateIsWechatPay(bool isWechatPay) {
    state = state
        .copyWith(isWechatPay: isWechatPay);
  }
}
