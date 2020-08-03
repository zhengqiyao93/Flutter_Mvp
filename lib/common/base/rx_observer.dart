import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'base_response.dart';
import 'base_view.dart';

typedef void OnSuccess(dynamic data);

typedef void OnFailure(String error);

class RxObserver<T> {

  //页面引用对象（显示进度框、提示语）
  BaseView view;
  //提示语
  String msg;
  //是否显示进度框
  bool isShowDialog;
  //成功回调
  OnSuccess onSuccess;
  //失败回调
  OnFailure onFailure;

  RxObserver(this.view, {this.onSuccess, this.onFailure, this.isShowDialog = true});


  ///http网络请求 [request] 接收 Stream 类型
  void requestHttp(Stream request) {

    request.doOnListen(() {

      //开始网络请求，根据提示语显示弹框
      if (view != null && isShowDialog) {
        view.showLoading(msg: msg);
      }

    }).listen((data) {
      //请求成功，返回结果，关闭弹框
      if (view != null && isShowDialog) {
        view.closeLoading();
      }

      //请求成功 获取数据data， data是返回结果json
      BaseResponse<T> response = BaseResponse.fromJson(data);

      if (response.resultCode != 100) {
        handlerError(response.resultMsg);
      } else {
        onSuccess(response.getData());
      }

    }, onError: (error) {
      if (view != null && isShowDialog) {
        view.closeLoading();
      }

      //请求失败
      DioError e = error;
      handlerError(e.message);
    }, onDone: () {
      //执行结束

    });

//    subject.cancel();

  }

  void handlerError(String error) {
    if (view != null && isShowDialog) {
      view.showError(errorMsg: error);
    }
    //请求失败
    onFailure(error);
  }
}