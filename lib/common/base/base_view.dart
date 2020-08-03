
abstract class BaseView {

  //显示请求进度框
  void showLoading({String msg});
  //关闭请求进度框
  void closeLoading();

  //
  void renderPage(Object object);
  //
  void reload();

  void showError({String errorMsg});

  void showDisConnect();

}