import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'common/application.dart';
import 'common/route/routes.dart';

import 'view/page_splash.dart';

void main() {
  //初始化路由管理
  Router router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;
  //注册
  Application.setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Color(0xFF00A0E9),
        splashColor: Colors.transparent,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      home: SplashPage(),
      onGenerateRoute: Application.router.generator,
//      routes: {
//        "/test" : (context) => new TestPage(),
//      },
    );
  }
}

