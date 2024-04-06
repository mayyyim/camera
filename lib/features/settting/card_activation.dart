import 'package:cameraApp/shared/Widget/basic_button.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivationPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return ActivationPageState();
  }
}

class ActivationPageState extends ConsumerState<ActivationPage> {
  late final TextEditingController verificationController;
  late final TextEditingController codeController;

  @override
  void initState() {
    verificationController = TextEditingController();
    codeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BasicHeader(text: "卡密激活"),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  pictureVerification(),
                  TextField(
                    controller: verificationController,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "请输入图片验证码",
                        hintStyle: TextStyle(
                          color: Theme.of(context).textTheme.labelSmall!.color,
                        ),
                        border: InputBorder.none,
                        counterStyle: const TextStyle(
                          color: Colors.black,
                        )),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    cursorColor: Theme.of(context).primaryColorDark,
                  ),
                  TextField(
                    controller: codeController,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "请输入您的卡密",
                        hintStyle: TextStyle(
                          color: Theme.of(context).textTheme.labelSmall!.color,
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                        counterStyle: const TextStyle(
                          color: Colors.black,
                        )),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    cursorColor: Theme.of(context).primaryColorDark,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BasicButton(
                    text: "确定激活",
                    onTap: () {
                      /// 激活
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pictureVerification() {
    return Container();
  }
}
