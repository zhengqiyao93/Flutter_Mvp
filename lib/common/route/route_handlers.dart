import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/page_detail.dart';
import 'package:flutter_app/view/page_login.dart';
import 'package:flutter_app/view/page_main.dart';
import 'package:flutter_app/view/page_splash.dart';

//欢迎页
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return SplashPage();
    }
);

//主页
var mainHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return MainPage();
    }
);

//登录页
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return LoginPage();
    }
);

//详情页
var detailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      String carId = params["carId"][0];
      return DetailPage(carId);
    }
);