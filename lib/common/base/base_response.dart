
import 'package:flutter_app/models/entity_factory.dart';

///处理接口返回的数据
class BaseResponse<T> {
  dynamic data;
  bool success;
  int resultCode;
  String resultMsg;

  BaseResponse({this.data, this.success, this.resultCode, this.resultMsg});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    success = json['success'];
    resultCode = json['resultCode'];
    resultMsg = json['resultMsg'];
  }

  /// 获取results对象
  T getData() {
    return EntityFactory.generateOBJ<T>(data); //使用EntityFactory解析对象
  }

  /// 获取results数组
  List<T> getList() {
    var newList = new List<T>();
    if (data != null) {
      data.forEach((v) { //拼装List
        newList.add(EntityFactory.generateOBJ<T>(v));//使用EntityFactory解析对象
      });
    }
    return newList;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['success'] = this.success;
    data['resultCode'] = this.resultCode;
    data['resultMsg'] = this.resultMsg;
    return data;
  }
}