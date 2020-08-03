import 'package:dio/dio.dart';

class ApiException implements Exception {
  String errorMsg;

  ApiExceptionType type;

  ApiException({this.errorMsg, this.type});
}

enum ApiExceptionType {
  COMMON,
}

class CommonException extends DioError {
  String errorMsg;

  DioErrorType type;

  CommonException({this.errorMsg, this.type}) : super(error: errorMsg, type: type);


}
