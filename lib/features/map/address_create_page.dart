import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressCreatePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return AddressCreatePageState();
  }
}

class AddressCreatePageState extends ConsumerState<AddressCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BasicHeader(text: "创建地址"),

            /// TODO
          ],
        ),
      ),
    );
  }
}
