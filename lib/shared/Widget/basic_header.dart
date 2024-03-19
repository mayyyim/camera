import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicHeader extends StatelessWidget {
  final String text;
  final Function()? onBackTap;
  final Function()? onWidgetTap;
  final Widget? widget;

  BasicHeader(
      {super.key,
      required this.text,
      this.onBackTap,
      this.onWidgetTap,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      height: 55,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: onBackTap ??
                    () {
                      context.pop();
                    }),
            Text(
              text,
              style: const TextStyle(fontSize: 18, color: Color(0xFF3F3F3F)),
            ),
            GestureDetector(
                onTap: onWidgetTap ?? () {},
                child: widget ??
                    Container(
                      width: 40,
                    ))
          ],
        ),
      ),
    );
  }
}
