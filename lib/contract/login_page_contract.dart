import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_presenter.dart';
import 'package:flutter_app/common/base/base_view.dart';
import 'package:flutter_app/models/bean/user_entity.dart';

abstract class ILoginView extends BaseView {
  /// 获取用户输入账号
  String getAccount();

  /// 获取用户输入密码
  String getPassword();

  /// 登录成功
  void loginSuccess(UserEntity entity);

}

abstract class ILoginPresenter<V extends BaseView>  extends BasePresenter<V> {

  /// 登录
  void login();

  /// 获取验证码
  void getPhoneCode();

}