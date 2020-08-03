

import 'base_view.dart';

class BasePresenter<V extends BaseView> {
  V view;


  /// 绑定视图，页面创建时调用
  void attachView(V view) {
    this.view = view;
  }

  /// 解绑视图，页面销毁时调用
  void detachView() {
    if (null != view) {
      this.view = null;
    }
  }
}
