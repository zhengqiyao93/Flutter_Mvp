import 'package:flutter_app/models/bean/empty_entity.dart';
import 'package:flutter_app/models/bean/user_entity.dart';
import 'package:flutter_app/models/bean/list_entity.dart';
import 'package:flutter_app/models/bean/car_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "EmptyEntity") {
      return EmptyEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else if (T.toString() == "ListEntity") {
      return ListEntity.fromJson(json) as T;
    } else if (T.toString() == "CarEntity") {
      return CarEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}