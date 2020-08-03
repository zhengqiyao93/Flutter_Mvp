import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_presenter.dart';
import 'package:flutter_app/common/base/base_view.dart';
import 'package:flutter_app/common/base/base_list_view.dart';
import 'package:flutter_app/models/bean/car_entity.dart';
import 'package:flutter_app/models/bean/user_entity.dart';

abstract class ICarListView extends BaseListView {

  /// 收藏成功
  void collectionSuccess();
  /// 取消收藏成功
  void cancelCollectionSuccess();
}

abstract class IListPresenter<V extends BaseView>  extends BasePresenter<V> {

  /// 获取列表
  void getList();

  /// 收藏车辆
  void collectionCar(CarEntity carEntity);

  /// 取消收藏车辆
  void cancelCollectionCar(CarEntity carEntity);
}