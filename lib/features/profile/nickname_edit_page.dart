import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

class NicknameEditPage extends ConsumerStatefulWidget {
  const NicknameEditPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NicknameEditPageState();
}

class _NicknameEditPageState extends ConsumerState<NicknameEditPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onChangeNickName() {
      if (_controller.text.isNotEmpty) {
        /// TODO
        /// update user alias
        context.pop();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              BasicHeader(
                text: "更改昵称",
                onWidgetTap: onChangeNickName,
                widget: const Text(
                  "完成",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0x1AFFFFFF),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(
                          1.0,
                          4.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextField(
                      controller: _controller,
                      autofocus: true,
                      maxLength: 12,
                      decoration: InputDecoration(
                          hintText: "请输入您的昵称",
                          hintStyle: TextStyle(
                            color:
                                Theme.of(context).textTheme.labelSmall!.color,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
