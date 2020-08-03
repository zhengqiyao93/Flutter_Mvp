import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/application.dart';
import 'package:flutter_app/common/base/base_state.dart';
import 'package:flutter_app/common/constants/constants.dart';
import 'package:flutter_app/common/route/route_util.dart';
import 'package:flutter_app/common/utils/util.dart';
import 'package:flutter_app/common/utils/util_sp.dart';
import 'package:flutter_app/common/utils/util_ui.dart';
import 'package:flutter_app/common/widget/color.dart';
import 'package:flutter_app/common/widget/custom_countdown.dart';
import 'package:flutter_app/common/widget/custom_text_field.dart';
import 'package:flutter_app/contract/login_page_contract.dart';
import 'package:flutter_app/models/bean/user_entity.dart';
import 'package:flutter_app/presenter/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BaseState<LoginPresenter, LoginPage> implements ILoginView{

  bool isPasswordLogin = false; //是否密码登录，默认验证码登录

  String _phoneNumber;
  String _password;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildAppBar() {

    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
    );
  }

  @override
  Widget buildPageLayout() {

    return Container(
      color: Colors.white,
      height: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[

          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: SingleChildScrollView(

              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start, //左侧对齐
                children: <Widget>[

                  //登录图标
                  Row(
                    children: <Widget>[
                      Image.asset("images/login_logo.png", width: UIUtil.getWidth(61), height: UIUtil.getHeight(61),),
                      UIUtil.createText("登录", 24, AppColor.black4, isBold: true, margin: EdgeInsets.only(left: 7)),
                      InkWell(
                        child: UIUtil.createText(isPasswordLogin ? "验证码登录" : "密码登录",
                            12, AppColor.grayText, isBold: true, margin: EdgeInsets.only(left: 10)),
                        onTap: (){
                          setState(() {
                            isPasswordLogin = !isPasswordLogin;
                          });
                        },
                      )

                    ],
                  ),

                  //提示
                  UIUtil.createText("未注册手机号验证后即完成注册", 12, AppColor.grayText, margin: EdgeInsets.only(top: 56, bottom: 10)),

                  //手机号
                  ITextField(
                    keyboardType: ITextInputType.phone,
                    hintText: '请输入手机号',
                    hintStyle: TextStyle(color: AppColor.grayText),
                    textStyle: TextStyle(color: AppColor.black4),
                    fieldCallBack: (content) {
                      _phoneNumber = content;
                      print(_phoneNumber);
                    },
                  ),
                  //密码
                  Container(
                    child: Stack(
                      children: <Widget>[
                        ITextField(
                          margin: EdgeInsets.only(top: 20),
                          keyboardType: ITextInputType.password,
                          hintText: isPasswordLogin ? '请输入密码' : '请输入验证码',
                          hintStyle: TextStyle(color: AppColor.grayText),
                          textStyle: TextStyle(color: AppColor.black4),
                          fieldCallBack: (content) {
                            _password = content;
                            print(_password);
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: CustomCountdown((){
                            print("请求验证码");
                          }),
                        )
                      ],
                    ),
                  ),

                  //登录
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    width: double.infinity,
                    height: UIUtil.getHeight(50),
                    child: RaisedButton(
                      child: Text("登录", style: TextStyle(fontSize: UIUtil.getSp(16)),),
                      textColor: AppColor.black4,
                      color: AppColor.theme,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                      onPressed: _login,
                    ),
                  ),

                  //注册视图
                  isPasswordLogin ?
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, bottom: UIUtil.getHeight(82)),
                    child: Row(
                      children: <Widget>[
                        UIUtil.createText("没有账号，", 12, AppColor.black6, isBold: true),
                        InkWell(
                          child: UIUtil.createText("去注册", 12, AppColor.theme, isBold: true),
                          onTap: (){
                            print("去注册");
                          },
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        InkWell(
                          child: UIUtil.createText("忘记密码？", 12, AppColor.grayText, isBold: true, textAlign: TextAlign.end),
                          onTap: (){
                            print("忘记密码");
                          },
                        ),
                      ],
                    ),
                  ) : Text(""),
                ],
              ),
            ),
          ),

          //底部按钮
          Positioned(
//            width: double.infinity,
            bottom: 30,
            child: Row(

              children: <Widget>[
                Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "《服务协议》",
                        style: TextStyle(
                            color: AppColor.theme
                        ),
//                      recognizer: _tapRecognizer
                      ),
                      TextSpan(
                        text: "和",
                        style: TextStyle(
                            color: AppColor.grayText
                        ),
                      ),
                      TextSpan(
                        text: "《隐私政策》",
                        style: TextStyle(
                            color: AppColor.theme
                        ),
//                      recognizer: _tapRecognizer
                      ),
                    ]
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _login() {
    mPresenter.login();
  }

  @override
  void preparePage() {
    // TODO: implement preparePage
  }

  @override
  String getAccount() {
    return _phoneNumber;
  }

  @override
  String getPassword() {
    return _password;
  }

  @override
  LoginPresenter createPresenter() {
    return LoginPresenter();
  }

  @override
  void loginSuccess(UserEntity user) {
    Application.userEntity = user;
//    SpUtil.setToken("${data.userId}_${data.token}");
//    SpUtil.setObject("user", data);

//    Application.eventBus.fire("loginSuccess");
    //存储用户信息
    String userJson = Util.json2String(user.toJson());
    SpUtil.setString(SPKey.USER, userJson);
    RouteUtil.goMainPage(context, replace: true);
  }

}
