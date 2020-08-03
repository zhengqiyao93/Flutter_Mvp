import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/models/bean/user_entity.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network/dio_request.dart';

class Application {
  //路由管理
  static Router router;
  //依赖注入，全局单例
  static GetIt getIt = GetIt.instance;
  //全局用户信息
  static UserEntity userEntity;

  static SharedPreferences sp;

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }

  /// 是否登录
  static bool isLogin() {
    return userEntity != null;
  }

  static initScreenUtil(BuildContext context){
//    ScreenUtil.init(context, width: 720, height: 1280);
//    print('设置像素密度:${ScreenUtil.pixelRatio}');
//    print('设置的高度:${ScreenUtil.screenHeight}');
//    print('设置的宽度:${ScreenUtil.screenWidth}');
  }

  /// 依赖注入，全局单例对象
  static setup(){
    getIt.registerSingleton(new DioRequest());
    getIt.registerSingleton(new UserModel());
  }
}