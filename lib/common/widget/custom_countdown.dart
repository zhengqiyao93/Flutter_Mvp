import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/utils/util_ui.dart';

import 'color.dart';

/// 验证码倒计时
class CustomCountdown extends StatefulWidget {

  final Function onFunction;


  CustomCountdown(this.onFunction);

  @override
  _CustomCountdownState createState() => _CustomCountdownState();
}

class _CustomCountdownState extends State<CustomCountdown> {

  //定义变量
  Timer _timer;
  //倒计时数值
  var countdownTime = 0;

  //倒计时方法
  void startCountdown() {
    if (countdownTime != 0) return;
    countdownTime = 10;
    setState(() {

    });
    final call = (timer) {
      setState(() {
        if (countdownTime < 1) {
          _timer.cancel();
        } else {
          countdownTime -= 1;
        }
      });
    };
    _timer = Timer.periodic(Duration(seconds: 1), call);
  }

  String handleCodeText() {
    if (countdownTime > 0) {
      return "${countdownTime}s后重新获取";
    } else
      return "获取验证码";
  }
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      color: AppColor.grayF9,
      child: UIUtil.createText(handleCodeText(), 12, AppColor.black6),
      onPressed: (){
        startCountdown();
        widget.onFunction();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
