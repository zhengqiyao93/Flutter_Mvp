import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/application.dart';
import 'package:flutter_app/common/base/base_presenter.dart';
import 'package:flutter_app/common/base/base_state.dart';
import 'package:flutter_app/common/base/base_view.dart';
import 'package:flutter_app/common/constants/constants.dart';
import 'package:flutter_app/common/route/route_util.dart';
import 'package:flutter_app/common/utils/util.dart';
import 'package:flutter_app/common/utils/util_sp.dart';
import 'package:flutter_app/models/bean/user_entity.dart';

/// 欢迎页
class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends BaseState<BasePresenter, SplashPage> {


  //定义变量
  Timer _timer;
  //倒计时数值
  int _countdownTime = 3;

  //倒计时方法
  _startCountdown() {
    final call = (timer) {
      setState(() {
        if (_countdownTime < 1) {
          _goToNextPage();
        } else {
          _countdownTime -= 1;
        }
      });
    };
    _timer = Timer.periodic(Duration(seconds: 1), call);
  }

  _goToNextPage(){
    _timer.cancel();

    //获取本地用户信息，如已登录跳转主页面，未登录跳转登录页
    SpUtil.getString(SPKey.USER).then((value){
      print(value);
      if (null == value) {
        RouteUtil.goLoginPage(context, replace: true);
      } else {
        UserEntity userEntity = Util.string2Json(value);
        Application.userEntity = userEntity;
        RouteUtil.goMainPage(context, replace: true);
      }
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    _startCountdown();
    super.initState();
  }


  @override
  Widget buildAppBar() {
    // TODO: implement buildAppBar
    return null;
  }

  @override
  Widget buildPageLayout() {
    // TODO: implement buildPageLayout
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
//          Image.asset('images/startup.png'),
          Positioned(
            top: 50,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: _goToNextPage,
                child: Text(
                  '跳过 $_countdownTime',
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0x66000000),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(width: 0.33, color: Colors.lightBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  BasePresenter<BaseView> createPresenter() {
    // TODO: implement createPresenter
    return null;
  }

  @override
  void preparePage() {
    // TODO: implement preparePage
  }
}
