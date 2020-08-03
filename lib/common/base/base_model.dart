

import 'package:flutter_app/common/network/dio_request.dart';
import 'package:get_it/get_it.dart';

import 'rx_observer.dart';

class BaseModel {

  //接口请求操作类-全局单例
  DioRequest dioRequest = GetIt.instance<DioRequest>();
  //请求列表接口，每页数量
  int pageCount = 10;
  //参数
  Map<String, dynamic> params = new Map();

  void sendRequest(Stream stream, RxObserver observer) {
    //发送请求
    observer.requestHttp(stream);
  }
}