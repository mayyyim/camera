import 'package:cameraApp/constants.dart';
import 'package:cameraApp/features/vip/vip_provider.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VipPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return VipPageState();
  }
}

class VipPageState extends ConsumerState<VipPage> {
  @override
  Widget build(BuildContext context) {
    bool isWechatPay = ref.watch(vipProvider).isWechatPay;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(context),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  PromotionCard(price: '¥166', originalPrice: '¥799'),
                  PromotionCard(price: '¥166', originalPrice: '¥799'),
                  PromotionCard(price: '¥166', originalPrice: '¥799'),
                ],
              ),
              const SizedBox(height: 10),
              Text("请选择支付方式"),
              ListTile(
                leading: Image.asset(
                  'assets/icon/weixin.png',
                  width: 40,
                ),
                title: const Text('微信'),
                trailing: Checkbox(
                  value: isWechatPay,
                  onChanged: (bool? value) {
                    setState(() {
                      ref.read(vipProvider.notifier).updateIsWechatPay(value!);
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/icon/zhifubao.png',
                  width: 40,
                ),
                title: const Text('支付宝'),
                trailing: Checkbox(
                  value: !isWechatPay,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        ref
                            .read(vipProvider.notifier)
                            .updateIsWechatPay(!value!);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Color(0xFFFB6500) // width and height
                      ),
                  onPressed: () {},
                  child: const Text(
                    '立即开通',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      const TextSpan(
                          text: '开通即表示同意',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Stack(
        children: [
          Container(
            height: 230,
            decoration: const BoxDecoration(color: Color(0xFFFFF1DC)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BasicHeader(
                  text: "会员中心",
                  backgroundColor: const Color(0xFFFFF1DC),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(margin: EdgeInsets.only(top: 70), child: _buildIcons()),
        ],
      ),
    );
  }

  Widget _buildIcons() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // to disable GridView's scrolling
        crossAxisCount: 4,
        children: List.generate(12, (index) {
          // Generate a list of icons
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(Constants.VIP_FUNCTIONS.keys.toList()[index],
                  width: 30),
              // Replace with actual icons
              Text(
                Constants.VIP_FUNCTIONS.values.toList()[index],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              // Replace with actual text
            ],
          );
        }),
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String price;
  final String originalPrice;

  const PromotionCard(
      {Key? key, required this.price, required this.originalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            '续费会员',
            style: TextStyle(color: Colors.deepOrange),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '原价$originalPrice',
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
