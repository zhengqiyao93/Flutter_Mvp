import 'package:flutter/material.dart';

/// 提示视图：加载中、空视图、失败视图
class HintWidget extends StatefulWidget {


  static const int LOADING = 1;
  static const int EMPTY = 2;
  static const int ERROR = 3;

  //提示标题
  final String title;
  //提示内容
  final String content;
  //提示类型
  final int type;

  final Function function;

  HintWidget(this.type, {this.title, this.content, this.function});

  @override
  _HintWidgetState createState() => _HintWidgetState();
}

class _HintWidgetState extends State<HintWidget> {
  @override
  Widget build(BuildContext context) {
    String title;
    if (widget.type == HintWidget.LOADING) {
      title = widget.title ?? "数据加载中";
    } else if (widget.type == HintWidget.ERROR) {
      title = widget.title ?? "加载失败，点击重试";
    } else {
      title = widget.title ?? "暂无数据";
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: InkWell(
        child: Text(title),
        onTap: widget.function,
      ),
    );
  }
}
