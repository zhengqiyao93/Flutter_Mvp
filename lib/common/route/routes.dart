import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'route_handlers.dart';

class Routes {
  static String ROOT = "/";
  static String SPLASH = "/splash";
  static String MAIN = "/main";
  static String LOGIN = "/login";
  static String TEST = "/test";
  static String DETAIL = "/detail";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('route not found!');
//          return LoginPage();
        return null;
    });
    router.define(ROOT, handler: splashHandler);
    router.define(LOGIN, handler: loginHandler);
    router.define(MAIN, handler: mainHandler);
    router.define("$DETAIL/:carId", handler: detailHandler);
  }
}
