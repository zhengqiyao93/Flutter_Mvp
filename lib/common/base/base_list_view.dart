


import 'package:flutter_app/models/bean/list_entity.dart';

import 'base_view.dart';

abstract class BaseListView extends BaseView {

  //加载成功
  void listSuccess(ListEntity result);
  //加载失败
  void listFailure();
  //获取当前页数
  int getPage();

}