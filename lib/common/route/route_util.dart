import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../application.dart';
import 'routes.dart';

typedef ReturnResult = void Function(dynamic result);

class RouteUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
        ReturnResult onResult,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionsBuilder}) {
    replace = replace??false;
    Application.router.navigateTo(
        context, 
        path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionsBuilder, 
        transition: TransitionType.material) //过场效果
        .then((result){
          if (onResult != null) {
            print(result);
            onResult(result);
          }
        });
  }

  //首页
  static void goMainPage(BuildContext context, {bool replace}) {
    _navigateTo(context, Routes.MAIN, replace: replace, clearStack: true);
  }

  //登录页
  static void goLoginPage(BuildContext context, {bool replace}) {
    _navigateTo(context, Routes.LOGIN, replace: replace);
  }

  //详情页
  static void goDetailPage(BuildContext context, String carId, {bool replace}) {
    _navigateTo(context, "${Routes.DETAIL}/$carId", replace: replace);
  }


  //返回上一个页面
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  //返回上一个页面
  static void popResult(BuildContext context, String result) {
    Navigator.of(context).pop(result);
  }

}
