import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressSelectPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return AddressSelectPageState();
  }
}

class AddressSelectPageState extends ConsumerState<AddressSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BasicHeader(text: "选择地址"),

            /// TODO
          ],
        ),
      ),
    );
  }
}
