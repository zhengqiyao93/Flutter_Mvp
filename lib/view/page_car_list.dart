import 'package:flutter/material.dart';
import 'package:flutter_app/common/application.dart';
import 'package:flutter_app/common/base/base_list_state.dart';
import 'package:flutter_app/common/route/route_util.dart';
import 'package:flutter_app/common/utils/util.dart';
import 'package:flutter_app/contract/car_list_page_contract.dart';
import 'package:flutter_app/models/bean/car_entity.dart';
import 'package:flutter_app/presenter/car_list_presenter.dart';

import 'itemview/item_car.dart';

/// 车辆列表
class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

/// 指定泛型 ，最后一个类型为列表对应的实体类
class _CarListPageState extends BaseListPageState<CarListPresenter, CarListPage, CarEntity> implements ICarListView{

  @override
  Widget buildAppBar() {
    // TODO: implement buildAppBar
    return new AppBar(title: Text("列表页"),);
  }

  @override
  Widget buildItem(BuildContext context, int index) {
    // TODO: implement buildItem
    return OnlineCarItem(list[index], (carEntity){

      if (Application.isLogin()) {
        //根据收藏状态，调用不同接口
        if (Util.equals(carEntity.isFollow, "1")) {
          mPresenter.cancelCollectionCar(carEntity);
        } else {
          mPresenter.collectionCar(carEntity);
        }
      } else {
        RouteUtil.goLoginPage(context);
      }

    });
  }

  @override
  Widget buildPageLayout() {
    // TODO: implement buildPageLayout
    return buildListView();
  }

  @override
  CarListPresenter createPresenter() {
    // TODO: implement createPresenter
    return new CarListPresenter();
  }

  @override
  void onItemClick(BuildContext context, int index) {
    // TODO: implement onItemClick
    CarEntity carEntity = list[index];
    print("点击:$carEntity");
    RouteUtil.goDetailPage(context, carEntity.id.toString());
  }

  @override
  void preparePage() {
    // TODO: implement preparePage
    requestListData();
  }

  @override
  void requestListData() {
    // TODO: implement requestListData
    mPresenter.getList();
  }

  @override
  void collectionSuccess() {
    // TODO: implement likeSuccess
    // 操作成功，刷新列表
    setState(() {

    });
  }

  @override
  void cancelCollectionSuccess() {
    // TODO: implement cancelCollectionSuccess
    // 操作成功，刷新列表
    setState(() {

    });
  }

}
