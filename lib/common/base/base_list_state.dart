import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/widget_hint.dart';
import 'package:flutter_app/models/bean/list_entity.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_entity.dart';
import 'base_presenter.dart';
import 'base_state.dart';
import 'base_list_view.dart';


/// 列表页面的state基类
abstract class BaseListPageState<P extends BasePresenter, W extends StatefulWidget, T extends BaseEntity> extends BaseState<P, W> implements BaseListView {

  List<T> list = [];

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  int page = 1;

  int total;

  bool isFailure = false;

  void _onRefresh() async {
    page = 1;
    requestListData();
  }

  void _onLoading() async {
    requestListData();
  }

  @override
  int getPage() {
    return page;
  }

  @override
  void listFailure() {
    if (page == 1) {
      isFailure = true;
      _refreshController.refreshCompleted();
    } else {
      _refreshController.loadFailed();
    }

    setState(() {

    });
  }

  @override
  void listSuccess(ListEntity result) {
    total = result.count;
    if (page == 1) {
      isFailure = false;
      setEnableLoadMore(true);
      list.clear();
      list.addAll(result.getList<T>());
      _refreshController.refreshCompleted();
    } else {
      list.addAll(result.getList<T>());
      _refreshController.loadComplete();
    }
    page++;

    if (list == null || list.length == 0) { //列表为空

      return;
    }
    if (list.length >= total) {//没有更多数据了
      _refreshController.loadNoData();
    }

    setState(() {

    });
  }


  //是否开启下拉刷新
  bool enableRefresh = true;
  //是否开启上拉加载
  bool enableLoadMore = true;

  /// 构建一个带刷新的列表视图
  Widget buildListView() {
    return SmartRefresher (
      enablePullDown: enableRefresh,
      enablePullUp: enableLoadMore,
      // WaterDropHeader、ClassicHeader、CustomHeader、LinkHeader、MaterialClassicHeader、WaterDropMaterialHeader
      header: ClassicHeader(
        height: 45.0,
        releaseText: '松开手刷新',
        refreshingText: '刷新中',
        completeText: '刷新完成',
        failedText: '刷新失败',
        idleText: '下拉刷新',
      ),

      // ClassicFooter、CustomFooter、LinkFooter、LoadIndicator
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("上拉加载更多");
          }
          else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          }
          else if (mode == LoadStatus.failed) {
            body = Text("加载失败，点击重试");
          }
          else {
            body = Text("已经到底了");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: contentView(),
    );
  }

  ///有返回列表视图。无数据，返回空视图
  Widget contentView() {
    if (page == 1 && isFailure) {
      return HintWidget(HintWidget.ERROR, function: () {
        /// 列表请求失败时，重新请求
        requestListData();
      });
    }

    if (list == null || list.length == 0) {
      //第一次返回加载中，total有值时，list=0返回空视图
      return HintWidget(total != null ? HintWidget.EMPTY : HintWidget.LOADING);
    } else {
      //返回列表视图
      return ListView.builder(
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: () {
              //item Click
              onItemClick(context, index);
            },
            child: buildItem(context, index),
          );
        },
        itemCount: list.length,
//        itemExtent: 100.0,
//        cacheExtent: 10,
      );
    }
  }

  //构建列表行布局
  Widget buildItem(BuildContext context, int index);

  //列表行点击事件
  void onItemClick(BuildContext context, int index);

  //请求列表数据
  void requestListData();

  //是否开启加载更多
  void setEnableLoadMore(enable) {
    enableLoadMore = enable;
  }

  //是否开启下拉刷新
  void setEnableRefresh(enable) {
    enableRefresh = enable;
  }

  // don't forget to dispose refreshController
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

}