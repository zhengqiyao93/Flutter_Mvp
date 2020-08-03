import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_model.dart';
import 'package:flutter_app/common/base/rx_observer.dart';
import 'package:flutter_app/common/utils/util.dart';

import 'bean/empty_entity.dart';
import 'bean/list_entity.dart';
import 'url.dart';

class UserModel extends BaseModel {


  /// 登录
  void login(String account, String password, RxObserver observer){
    password = Util.generateMd5(password);

    params.clear();
    params['username'] = account;
    params['password'] = password;

    Stream stream = dioRequest.handlerFormPost(Url.login, params: params);
    sendRequest(stream, observer);
  }

  /// 获取列表
  void getCarList(int page, RxObserver observer) {
    Stream stream = dioRequest.handlerJsonPost(Url.getOnlineCarList, params: {
      'page':page,
      'count':pageCount
    });
    sendRequest(stream, observer);
  }

  /// 收藏
  void collection(String carId, RxObserver<EmptyEntity> observer) {
    params.clear();
    params['autoId'] = carId;

    Stream stream = dioRequest.handlerJsonPost(Url.collectionCar, params: params);
    sendRequest(stream, observer);
  }

  /// 取消收藏
  void cancelCollection(String carId, RxObserver<EmptyEntity> observer) {
    params.clear();
    params['autoId'] = carId;

    Stream stream = dioRequest.handlerJsonPost(Url.cancelCollectionCar, params: params);
    sendRequest(stream, observer);
  }

}