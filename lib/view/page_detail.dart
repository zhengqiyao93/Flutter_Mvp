import 'package:flutter/material.dart';
import 'package:flutter_app/common/base/base_presenter.dart';
import 'package:flutter_app/common/base/base_state.dart';
import 'package:flutter_app/common/base/base_view.dart';

class DetailPage extends StatefulWidget {

  final String carId;

  const DetailPage(this.carId);

  @override
  _DetailPageState createState() => _DetailPageState(carId);
}

class _DetailPageState extends BaseState<BasePresenter,DetailPage> {

  final String carId;

  _DetailPageState(this.carId);


  @override
  Widget buildAppBar() {
    // TODO: implement buildAppBar
    return new AppBar(title: Text("详情页"),);
  }

  @override
  Widget buildPageLayout() {
    // TODO: implement buildPageLayout
    return Container(
      child: Center(
        child: Text("车辆id:$carId"),
      ),
    );
  }

  @override
  BasePresenter<BaseView> createPresenter() {
    // TODO: implement createPresenter
    return null;
  }

  @override
  void preparePage() {
    // TODO: implement preparePage
  }
}
