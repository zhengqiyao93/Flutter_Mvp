import 'package:flutter/material.dart';
import 'package:flutter_app/common/application.dart';
import 'package:flutter_app/common/base/base_presenter.dart';
import 'package:flutter_app/common/base/base_state.dart';
import 'package:flutter_app/common/constants/constants.dart';
import 'package:flutter_app/common/route/route_util.dart';
import 'package:flutter_app/common/utils/util_sp.dart';
import 'package:flutter_app/common/utils/util_ui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<BasePresenter, HomePage> {



  void _exitButtonClick() {
    UIUtil.createDialog(context, '提示', '是否退出登录', (){
      SpUtil.remove(SPKey.USER).then((bool){
        Application.userEntity = null;
        RouteUtil.goLoginPage(context);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("initState");
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
        child: Center(
          child: FlatButton(
            child: Text("测试退出登录"),
            onPressed: _exitButtonClick,
          ),
        )
    );
  }

  @override
  createPresenter() {
    // TODO: implement createPresenter
    return null;
  }

  @override
  void preparePage() {
    // TODO: implement preparePage
  }

}
