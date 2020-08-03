import 'package:dio/dio.dart';
import 'package:flutter_app/common/constants/constants.dart';
import 'package:flutter_app/common/utils/util.dart';
import 'package:flutter_app/common/utils/util_sp.dart';
import 'package:flutter_app/models/bean/user_entity.dart';

import '../application.dart';
import 'dio_exception.dart';
import 'dio_factory.dart';
import 'dio_result_code.dart';

class DioRequest {

  /// http request methods
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String PUT = 'PUT';
  static const String PATCH = 'PATCH';
  static const String DELETE = 'DELETE';

  static DioFactory _dioFactory = DioFactory.instance;

  Future request(String action, String url, {Map<String, dynamic> params, bool isJson}) async {
    var formData;

    if (!isJson) {
      formData = params != null ? FormData.fromMap(params) : null;
    } else {
      formData = params;
    }

    // 获取本地token，添加请求头
    if(Application.userEntity != null){
      UserEntity user = Application.userEntity;

      /// 动态添加headers
      Map<String, String> headers = new Map();
      //token
      headers['authorization'] = '${user.userId}_${user.token}';
      //时间戳
      headers['timestamp'] = Util.currentTimeMillis().toString();
      //版本号
      headers['version'] = '2.0';
      _dioFactory.dio.options.headers.addAll(headers);
    } else {
      _dioFactory.dio.options.headers.remove('authorization');
    }
    Response response;

    try {
      switch (action) {
        case GET:
          response =
          await _dioFactory.dio.get(url, queryParameters: params);
          break;
        case POST:
          response = await _dioFactory.dio.post(url, data: formData);
          break;
      }
    } on DioError catch (error) {
      print('请求出错：' + error.toString());

      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: ResultCode.NO_NETWORK);
      }
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      throw CommonException(errorMsg: "网络异常");
    }


    return response.data;
  }

  Stream _get(String url, {Map<String, dynamic> params}) =>
      Stream.fromFuture(request(GET, url, params: params)).asBroadcastStream();

  Stream _post(String url, Map<String, dynamic> params, bool isJson) {
    return Stream.fromFuture(request(POST, url, params: params, isJson: isJson)).asBroadcastStream();
  }


  Stream handlerGet(String requestUrl, {Map params}) {
    return _get(requestUrl);
  }

  Stream handlerFormPost(String requestUrl, {Map<String, dynamic> params}) {
    return _post(requestUrl, params, false);
  }

  Stream handlerJsonPost(String requestUrl, {Map<String, dynamic> params}) {
    return _post(requestUrl, params, true);
  }
}
