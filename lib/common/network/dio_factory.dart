import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/common/constants/constants.dart';

import 'dio_interceptor_log.dart';

class DioFactory {
  /// global dio object
  Dio dio;

  /// default options
  static const int CONNECT_TIMEOUT = 15000;
  static const int RECEIVE_TIMEOUT = 15000;

  factory DioFactory() => _getInstance();

  static DioFactory get instance => _getInstance();
  static DioFactory _instance;
  BaseOptions options;

  ///是否开启代理
  bool isProxy = false;

  DioFactory._internal() {
    dio = Dio()
      ..options = BaseOptions(
          baseUrl: Constants.BASE_URL,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          headers: {"appid": Constants.APP_ID})
      ..interceptors.add(LogHttpInterceptor());
    if (isProxy) {
      //Fiddler 抓包设置代理
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (url) {
          return "PROXY 192.168.0.122:8888";
        };
        //抓Https包设置
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  static DioFactory _getInstance() {
    if (_instance == null) {
      _instance = DioFactory._internal();
    }
    return _instance;
  }


//  /// request method
//  //url 请求链接
//  //parameters 请求参数
//  //metthod 请求方式
//  //onSuccess 成功回调
//  //onError 失败回调
//  static Future<Map> request<T>(String url,
//      {parameters,
//        method,
//        Function(T t) onSuccess,
//        Function(String error) onError}) async {
//    parameters = parameters ?? {};
//    method = method ?? 'GET';
//
//    /// 请求处理
//    parameters.forEach((key, value) {
//      if (url.indexOf(key) != -1) {
//        url = url.replaceAll(':$key', value.toString());
//      }
//    });
//
//
//    Dio dio = DioFactory.instance.dio;
//    //请求结果
//    var result;
//    try {
//      Response response = await dio.request(url,
//          data: parameters, options: new Options(method: method));
//      result = response.data;
//      if (response.statusCode == 200) {
//        if (onSuccess != null) {
//          onSuccess(result);
//        }
//      } else {
//        throw Exception('statusCode:${response.statusCode}');
//      }
//    } on DioError catch (e) {
//      onError(e.toString());
//    }
//
//    return result;
//  }

}
