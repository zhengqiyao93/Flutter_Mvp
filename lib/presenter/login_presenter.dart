import 'dart:async';

import 'package:flutter_app/common/application.dart';
import 'package:flutter_app/common/base/rx_observer.dart';
import 'package:flutter_app/contract/login_page_contract.dart';
import 'package:flutter_app/models/bean/user_entity.dart';
import 'package:flutter_app/models/user_model.dart';

class LoginPresenter extends ILoginPresenter<ILoginView> {

  @override
  void login() {
    // TODO: implement login
    String account = view.getAccount();
    String password = view.getPassword();

    if (account == null || account.length == 0) {
      view.showError(errorMsg: '请输入手机号');
      return;
    }
    if (password == null || password.length == 0) {
      view.showError(errorMsg: '请输入密码');
      return;
    }

    Application.getIt.get<UserModel>().login(account, password, new RxObserver<UserEntity>(view,
      onSuccess: (data) {
        print(data);
        view.loginSuccess(data);
      },
      onFailure: (error) {

      }
    ));
  }

  @override
  void getPhoneCode() {
    // TODO: implement getPhoneCode
  }

}