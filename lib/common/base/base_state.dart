import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/utils/util_toast.dart';
import 'package:flutter_app/common/widget/dialog_loading.dart';

import 'base_presenter.dart';
import 'base_view.dart';

/// state基类
abstract class BaseState<P extends BasePresenter, W extends StatefulWidget>
    extends State<W> with AutomaticKeepAliveClientMixin implements BaseView {

  P mPresenter;
  //是否初始化
  bool _isPrepared = false;
  //请求dialog
  LoadingDialog dialog;

  @override
  void initState() {
    mPresenter = createPresenter();
    _attachView();
    super.initState();
  }

  ///构建页面
  @override
  Widget build(BuildContext context) {
    super.build(context);
//    ScreenUtil.init(context, width: 750, height: 1334);
    if (!_isPrepared) {
      Timer.run(() => preparePage());
      _isPrepared = true;
    }
    return Scaffold(
      appBar: buildAppBar(),
      body: buildPageLayout(),
    );
  }

  Widget buildAppBar();

  Widget buildPageLayout();

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    _detachView();
  }

  P createPresenter();

  /// 初始化一次 =》 用于 presenter 请求网络数据后调用 showDialog 拿不到合适的 context 报错
  void preparePage();

  @override
  void reload() {}

  @override
  void renderPage(Object o) {}

  @override
  void showDisConnect() {}

  @override
  void showError({String errorMsg}) {
    if (errorMsg != null) {
      ToastUtil.showToast(errorMsg);
    }
  }

  @override
  void showLoading({String msg}) {
    /// 把 dialog 的 show 从 普通页面里分离
    if (dialog == null) {
      dialog = LoadingDialog(
        text: msg ?? '加载中',
      );
    }
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  @override
  void closeLoading() {
    /// 必须和 showLoading 方法配对使用 ，避免 pop 当前页面
    if (dialog != null) {
      Navigator.pop(context);
      dialog = null;
    }
  }

  void _attachView(){
    if(null != mPresenter){
      mPresenter.attachView(this);
    }
  }

  void _detachView(){
    if(null != mPresenter){
      mPresenter.detachView();
    }
  }

  //不会被销毁,占内存中
  @override
  bool get wantKeepAlive => true;

}
