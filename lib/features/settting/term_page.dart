import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [BasicHeader(text: "用户协议")],
        ),
      ),
    );
  }
}
