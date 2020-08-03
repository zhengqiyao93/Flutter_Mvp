import 'dart:convert';
import 'dart:convert' as convert;

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

import 'package:flutter_app/models/entity_factory.dart';

class Util {


  /// MD5加密
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
// 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }


  /// json转字符串
  static String json2String(var json){
    String jsonString = convert.jsonEncode(json);
    return jsonString;
  }

  /// 字符串转json转对象
  static T string2Json<T>(String string){
    Map<String, dynamic> json = convert.jsonDecode(string);
    return EntityFactory.generateOBJ<T>(json);

//    var jsonTxt1 = '{ "name": "John Smith", "email": "john@example.com"}';
//    var jsonTxt2 = '["小明","韩梅梅","李华"]';
//    List nameList = convert.jsonDecode(jsonTxt2);
  }


  /// 返回当前时间戳
  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  /// 字符串比较
  static bool equals(String str1, String str2){
    //相同=0
    return Comparable.compare(str1, str2) == 0;
  }

}