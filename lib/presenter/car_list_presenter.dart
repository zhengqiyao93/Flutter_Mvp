import 'package:flutter/material.dart';
import 'package:flutter_app/common/application.dart';
import 'package:flutter_app/common/base/rx_observer.dart';
import 'package:flutter_app/contract/car_list_page_contract.dart';
import 'package:flutter_app/models/bean/car_entity.dart';
import 'package:flutter_app/models/bean/empty_entity.dart';
import 'package:flutter_app/models/bean/list_entity.dart';
import 'package:flutter_app/models/user_model.dart';

class CarListPresenter extends IListPresenter<ICarListView> {
  @override
  void getList() {
    Application.getIt.get<UserModel>().getCarList(view.getPage(), new RxObserver<ListEntity>(view,
      onSuccess: (data) {
        view.listSuccess(data);
      },
      onFailure: (error) {
        view.listFailure();
      }
    ));
  }

  @override
  void collectionCar(CarEntity carEntity) {
    Application.getIt.get<UserModel>().collection(carEntity.id.toString(), new RxObserver<EmptyEntity>(view,
        onSuccess: (data) {
          //车辆关注状态更改
          carEntity.isFollow = carEntity.isFollow.toString().endsWith("1") ? "2" : "1";
          view.collectionSuccess();
        },
        onFailure: (error) {

        }
    ));
  }

  @override
  void cancelCollectionCar(CarEntity carEntity) {
    Application.getIt.get<UserModel>().cancelCollection(carEntity.id.toString(), new RxObserver<EmptyEntity>(view,
        onSuccess: (data) {
          //车辆关注状态更改
          carEntity.isFollow = carEntity.isFollow.toString().endsWith("1") ? "2" : "1";
          view.cancelCollectionSuccess();
        },
        onFailure: (error) {

        }
    ));
  }

}