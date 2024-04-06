import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountdownDialog extends StatefulWidget {
  final int counter;

  const CountdownDialog({Key? key, required this.counter}) : super(key: key);

  @override
  _CountdownDialogState createState() => _CountdownDialogState();
}

class _CountdownDialogState extends State<CountdownDialog> {
  late Timer _timer;
  late int _counter;
  bool _dialogClosed = false;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
          _dialogClosed = true;
          Navigator.pop(context); // Close the dialog
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: !_dialogClosed ? Text('$_counter') : Text('倒计时结束！'),
    );
  }
}
